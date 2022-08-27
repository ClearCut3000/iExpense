//
//  AddView.swift
//  iExpense
//
//  Created by Николай Никитин on 26.08.2022.
//

import SwiftUI

struct AddView: View {

  //MARK: - View Properties
  @State private var name = ""
  @State private var type: Type = .utilities
  @State private var amount: Double? = nil
  @Environment(\.dismiss) var dismiss

  @ObservedObject var expenses: Expenses

  let types = Type.allCases

  //MARK: - View Body
    var body: some View {
      NavigationView {
        Form {
          TextField("Name", text: $name)

          Picker("Type", selection: $type) {
            ForEach(types, id: \.self) {
                PickerView(type: $0)
            }
          }

          TextField("Amount", value: $amount, format: UIHelper.localCurrency)
            .disableAutocorrection(true)
            .keyboardType(.decimalPad)
        }
        .navigationTitle("Add new expense")
        .toolbar {
          ToolbarItem(placement: .primaryAction) {
            Button("Save") {
              let item = ExpenseItem(name: name, type: type, amount: amount ?? 0.0)
              expenses.items.append(item)
              dismiss()
            }
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Button("Cancel") {
              dismiss()
            }
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
