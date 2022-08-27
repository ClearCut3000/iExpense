//
//  ExpenseItemView.swift
//  iExpense
//
//  Created by Николай Никитин on 27.08.2022.
//

import SwiftUI

struct ExpenseItemView: View {
  var item: ExpenseItem

    var body: some View {
      HStack {
        Image(systemName: item.type.systemNameIcon)
          .resizable()
          .frame(width: 50, height: 50)
          .padding(8)
          .foregroundColor(item.type.color)
          .background(item.type.color.opacity(0.5))
          .cornerRadius(40)
        VStack(alignment: .leading) {
          Text(item.name)
            .font(.headline)
          Text(item.type.rawValue.capitalized)
          Text(DateFormatter.dateFormatter.localizedString(for: item.date , relativeTo: Date()))
        }
        Spacer()
        Text(item.amount, format: .currency(code: "USD"))
          .font(.system(.title))
      }
    }
}



struct ExpenseItemView_Previews: PreviewProvider {
    static var previews: some View {
      ExpenseItemView(item: ExpenseItem(name: "Some", type: Type.utilities, amount: 99.99))
    }
}
