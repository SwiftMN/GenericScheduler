//
//  RepositoryProtocol.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import Foundation

protocol RepositoryProtcol: ManagedObjectContextFetchable {
  associatedtype T
  func new() -> T
  func delete(object: T)
  func save() -> Bool
}
