//
//  NotificationHandler.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 2/16/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit

struct NotificationHandler<T> {
  let name: Notification.Name
  let handle: (Notification) -> T
}

enum Handlers {
  static let keyboardHandler = NotificationHandler<Keyboard>(name: Notification.Name.UIKeyboardDidChangeFrame) { notification in
    guard let start = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? CGRect, let end = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect, let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval else { fatalError("Bad Notification") }
    return Keyboard(startFrame: start, endFrame: end, animationDuration: duration)
  }

  static let keyboardHidingHandler = NotificationHandler<Keyboard>(name: Notification.Name.UIKeyboardDidHide) { notification in
    guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval else { fatalError("Bad Notification") }
    return Keyboard(startFrame: .zero, endFrame: .zero, animationDuration: duration)
  }
}
