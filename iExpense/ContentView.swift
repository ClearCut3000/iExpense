//
//  ContentView.swift
//  iExpense
//
//  Created by Николай Никитин on 25.08.2022.
//

import SwiftUI

struct ContentView: View {

  //MARK: - View Properties
  @StateObject var expenses = Expenses()
  @State private var searchText = ""
  @State private var showingAddExpense = false

  //MARK: - View Body
  var body: some View {
    NavigationView {
      List {
        ForEach(expenses.items, id: \.id) { item in
          HStack {
            VStack(alignment: .leading) {
              Text(item.name)
                .font(.headline)
              Text(item.type)
            }
            Spacer()
            Text(item.amount, format: .currency(code: "USD"))
          }
        }
        .onDelete(perform: removeItems)
      }
      .searchable(text: $searchText) {
        ForEach(searchResults, id: \.self) { result in
          HStack {
            VStack(alignment: .leading) {
              Text(result.name)
                .font(.headline)
              Text(result.type)
            }
            Spacer()
            Text(result.amount, format: .currency(code: "USD"))
          }
        }
      }
      .navigationTitle("iExpense")
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

  //MARK: - Methods
  func removeItems(at offsets: IndexSet) {
      expenses.items.remove(atOffsets: offsets)
  }

  var searchResults: [ExpenseItem] {
         if searchText.isEmpty {
           return expenses.items
         } else {
           return expenses.items.filter { $0.name.contains(searchText) }
         }
     }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
