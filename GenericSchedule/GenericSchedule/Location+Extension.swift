//
//  Location+Extension.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData

extension Location: ManagedObject {
  static var defaultSortDescriptors: [NSSortDescriptor] {
    let sort = NSSortDescriptor(key: #keyPath(Location.name), ascending: false)
    return [sort]
  }

  static var defaultFetchRequest: NSFetchRequest<Location> {
    let request = NSFetchRequest<Location>(entityName: self.entityName)
    request.sortDescriptors = defaultSortDescriptors
    request.fetchBatchSize = 30
    return request
  }

  static var entityName: String {
    return "Location"
  }
}
