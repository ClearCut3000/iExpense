//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Николай Никитин on 26.08.2022.
//

import Foundation

struct ExpenseItem {
  let id = UUID()
  let name: String
  let type: String
  let amount: Double
}