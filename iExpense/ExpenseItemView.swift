//
//  ExpenseItemView.swift
//  iExpense
//
//  Created by Николай Никитин on 27.08.2022.
//

import SwiftUI

struct ExpenseItemView: View {

  //MARK: - View Properties
  var item: ExpenseItem

  //MARK: - View Body
    var body: some View {
      HStack {
        Image(systemName: item.type.systemNameIcon)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50, height: 50)
          .padding(8)
          .foregroundColor(item.type.color)
          .background(item.type.color.opacity(0.5))
          .cornerRadius(25)
        VStack(alignment: .leading) {
          Text(item.name)
            .font(.headline)
          Text(item.type.rawValue.capitalized)
            .font(.subheadline)
          Text(UIHelper.dateFormatter.localizedString(for: item.date , relativeTo: Date()))
            .font(.footnote)
        }
        Spacer()
        Text(item.amount, format: UIHelper.localCurrency)
          .font(.system(.title))
          .foregroundColor(getColor(for: item.amount))
      }
      .padding(8)
      .border(item.type.color)
    }

//MARK: - View Methods
  func getColor(for amount: Double) -> Color {
    switch amount {
    case 0..<10:
      return .blue
    case 10..<100:
      return .green
    default:
      return .red
    }
  }
}

struct ExpenseItemView_Previews: PreviewProvider {
    static var previews: some View {
      ExpenseItemView(item: ExpenseItem(name: "Some", type: Type.utilities, amount: 100))
    }
}
