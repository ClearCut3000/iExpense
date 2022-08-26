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
  @State private var type = "Personal"
  @State private var amount = 0.0

  @ObservedObject var expenses: Expenses

  let types = ["Bisness", "Personal"]


  //MARK: - View Body
    var body: some View {
      NavigationView {
        Form {
          TextField("Name", text: $name)

          Picker("Type", selection: $type) {
            ForEach(types, id: \.self) {
              Text($0)
            }
          }

          TextField("Amount", value: $amount, format: .currency(code: "USD"))
            .keyboardType(.decimalPad)
        }
        .navigationTitle("Add new expense")
      }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
      AddView(expenses: Expenses())
    }
}