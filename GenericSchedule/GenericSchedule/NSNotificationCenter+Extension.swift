//
//  NSNotificationCenter+Extension.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 2/16/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import Foundation

extension NotificationCenter {
  func addObserver<T>(handler: NotificationHandler<T>, using block: @escaping (T) -> ()) -> NotificationSpectator {
    let token = addObserver(forName: handler.name, object: nil, queue: nil, using: { notification in
      block(handler.handle(notification))
    })

    return NotificationSpectator(token: token, center: self)
  }
}
