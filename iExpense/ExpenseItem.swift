//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Николай Никитин on 26.08.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Hashable {
  var id = UUID()
  var date = Date.now
  let name: String
  let type: Type
  let amount: Double
}
