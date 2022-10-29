//
//  selectablePicker.swift
//  iExpense
//
//  Created by Николай Никитин on 29.10.2022.
//

import SwiftUI

struct SelectablePicker: View {

 @Binding var selectedItems: [Type]

  var body: some View {
    HStack {
      Spacer()
      Button {
        if self.selectedItems.count != Type.allCases.count {
          self.selectedItems = Type.allCases
        } else {
          self.selectedItems = []
        }
      } label: {
        Text(selectedItems.count == Type.allCases.count ? "All" : "\(selectedItems.count)")
          .frame(width: 28)
          .padding(5)
          .background(selectedItems.count == Type.allCases.count ? .red : .clear)
          .cornerRadius(10)
          .foregroundColor(selectedItems.count == Type.allCases.count ? .white : .red)
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(selectedItems.count == Type.allCases.count ? .clear : .red,
                      lineWidth: 1)
          )
      }
      Spacer()
      ForEach(Type.allCases, id: \.self) { item in
        Button {
          if self.selectedItems.contains(item) {
            self.selectedItems.removeAll(where: {$0 == item })
          } else {
            self.selectedItems.append(item)
          }
        } label: {
          Image(systemName: item.systemNameIcon)
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(item.color)
            .opacity(selectedItems.contains(item) ? 1.0 : 0.2)
        }
        Spacer()
      }
    }
  }
}
