//
//  Keyboard.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 2/16/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit

struct Keyboard: CustomStringConvertible {
  let startFrame: CGRect
  let endFrame: CGRect
  let animationDuration: TimeInterval

  var description: String {
    return "start: \(startFrame), end: \(endFrame), duration: \(animationDuration)"
  }
}
