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
}
