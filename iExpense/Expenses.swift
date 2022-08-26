//
//  Expenses.swift
//  iExpense
//
//  Created by Николай Никитин on 26.08.2022.
//

import SwiftUI

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
