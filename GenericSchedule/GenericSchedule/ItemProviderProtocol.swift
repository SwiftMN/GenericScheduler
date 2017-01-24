//
//  ItemProviderProtocol.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit

protocol ItemProvider: class {
  associatedtype T
  func object(at: IndexPath) -> T
  func numberOfItems(section: Int) -> Int
  func sections() -> Int
}

protocol ItemProviderDelegate: class {
  func itemProviderDidUpdate(updates: [ItemProviderUpdate]?)
}

enum ItemProviderUpdate {
  case Insert(IndexPath)
  case Update(IndexPath)
  case Move(IndexPath, IndexPath)
  case Delete(IndexPath)
}
