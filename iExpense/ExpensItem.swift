//
//  ExpensItem.swift
//  iExpense
//
//  Created by Hamza Osama on 12/10/2022.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
