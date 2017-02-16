//
//  NotificationSpectator.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 2/16/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import Foundation

final class NotificationSpectator {
  private let token: NSObjectProtocol
  private let center: NotificationCenter

  init(token: NSObjectProtocol, center: NotificationCenter) {
    self.token = token
    self.center = center
  }

  deinit {
    center.removeObserver(token)
  }
}
