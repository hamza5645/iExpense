//
//  Expenses.swift
//  iExpense
//
//  Created by Hamza Osama on 12/10/2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
