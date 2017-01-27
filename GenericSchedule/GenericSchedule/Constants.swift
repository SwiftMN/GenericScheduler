//
//  Constants.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/24/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import Foundation

enum DateFormatters {
  static var simpleDate: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, h:mm a"
    return formatter
  }()

  static var startOnDate: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "h a, d MMM"
    return formatter
  }()

  static var simplerDate: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM.dd.yy"
    return formatter
  }()
}
