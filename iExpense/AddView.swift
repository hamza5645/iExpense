//
//  AddView.swift
//  iExpense
//
//  Created by Hamza Osama on 26/10/2022.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var date = Date()
    
    let types = ["Business", "Personal" ]
    
    var body: some View {
        NavigationView {
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency (code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                
                DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                                Text("Select a date")
                            }
            }
            .navigationTitle("Add New Expense")
            
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount, date: date)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
