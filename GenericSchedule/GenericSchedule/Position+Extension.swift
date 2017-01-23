//
//  Position+Extension.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData

extension Position: ManagedObject {
  static var defaultSortDescriptors: [NSSortDescriptor] {
    let sort = NSSortDescriptor(key: #keyPath(Position.name), ascending: false)
    return [sort]
  }

  static var defaultFetchRequest: NSFetchRequest<Position> {
    let request = NSFetchRequest<Position>(entityName: self.entityName)
    request.sortDescriptors = defaultSortDescriptors
    request.fetchBatchSize = 30
    return request
  }

  static var entityName: String {
    return "Position"
  }
}
