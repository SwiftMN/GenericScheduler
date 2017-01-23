//
//  MangedObjectProtocol.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData

protocol ManagedObject: class {
  associatedtype T: NSFetchRequestResult
  static var defaultSortDescriptors: [NSSortDescriptor] { get }
  static var defaultFetchRequest: NSFetchRequest<T> { get }
  static var entityName: String { get }
}

extension ManagedObject {
  static var defaultSortDescriptors: [NSSortDescriptor] {
    return []
  }
}
