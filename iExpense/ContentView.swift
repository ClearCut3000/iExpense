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
  @State private var showingAddExpense = false

  //MARK: - View Body
  var body: some View {
    NavigationView {
      List {
        ForEach(expenses.items, id: \.id) { item in
          Text(item.name + " \(item.id)")
        }
        .onDelete(perform: removeItems)
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
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
