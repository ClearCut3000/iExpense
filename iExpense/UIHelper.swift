//
//  UIHelper.swift
//  iExpense
//
//  Created by Николай Никитин on 27.08.2022.
//

import Foundation

struct UIHelper {

  static let dateFormatter: RelativeDateTimeFormatter = {
      let formatter = RelativeDateTimeFormatter()
      formatter.unitsStyle = .full
      return formatter
  }()

  static var localCurrency:  FloatingPointFormatStyle<Double>.Currency {
    if let localCurrency = Locale.current.currencyCode {
      return .currency(code: localCurrency)
    } else {
      return .currency(code: "USD")
    }
  }
}
