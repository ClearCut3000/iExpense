//
//  PickerView.swift
//  iExpense
//
//  Created by Николай Никитин on 27.08.2022.
//

import SwiftUI

struct PickerView: View {
  var type: Type

  var body: some View {
    HStack {
      Image(systemName: type.systemNameIcon)
        .resizable()
        .frame(width: 20, height: 20)
      Text(type.rawValue.capitalized)
    }
    .padding(8)
    .foregroundColor(type.color)
    .background(type.color.opacity(0.2))
    .cornerRadius(18)
  }
}

struct PickerView_Previews: PreviewProvider {
  static var previews: some View {
    PickerView(type: .utilities)
  }
}
