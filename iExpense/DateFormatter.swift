//
//  DateFormatter.swift
//  iExpense
//
//  Created by Николай Никитин on 27.08.2022.
//

import Foundation

struct DateFormatter {

  static let dateFormatter: RelativeDateTimeFormatter = {
      let formatter = RelativeDateTimeFormatter()
      formatter.unitsStyle = .full
      return formatter
  }()
}
