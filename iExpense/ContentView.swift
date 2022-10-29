//
//  ContentView.swift
//  iExpense
//
//  Created by Hamza Osama on 28/09/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack{
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                            
                            Text(date.formatted(date: .long, time: .omitted))
                        }
                        
                        Spacer()
                        Spacer()
                        
                        if item.amount <= 10 {
                            Text (item.amount, format: .currency (code: Locale.current.currency?.identifier ?? "USD"))
                                .foregroundColor(.green)
                        } else if item.amount <= 100 {
                            Text (item.amount, format: .currency (code: Locale.current.currency?.identifier ?? "USD"))
                                .foregroundColor(.yellow)
                        } else {
                            Text (item.amount, format: .currency (code: Locale.current.currency?.identifier ?? "USD"))
                                .foregroundColor(.red)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("IExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
