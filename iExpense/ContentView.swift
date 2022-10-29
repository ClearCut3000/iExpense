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
  @State private var searchType: Type = .donation
  @State private var selectedItems: [Type] = Type.allCases

  //MARK: - View Body
  var body: some View {
    NavigationView {
      VStack {
        SelectablePicker(selectedItems: $selectedItems)
        List {
            ForEach(expenses.items, id: \.id) { item in
              if selectedItems.contains(item.type) {
                ExpenseItemView(item: item)
              }
            }
            .onDelete(perform: removeItems)
        }
        .searchable(text: $searchText) {
          ForEach(searchResults, id: \.self) { result in
            ExpenseItemView(item: result)
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
  }

  //MARK: - Methods
  func removeItems(at offsets: IndexSet) {
    expenses.items.remove(atOffsets: offsets)
  }

  var searchResults: [ExpenseItem] {
    if searchText.isEmpty {
      return expenses.items
    } else {
      return expenses.items.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
