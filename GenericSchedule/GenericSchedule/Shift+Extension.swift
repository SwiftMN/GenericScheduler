//
//  Shift+Extension.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData

extension Shift: ManagedObject {

  // defaultSortDescriptors is specified in a protocol extension
  
  static var defaultFetchRequest: NSFetchRequest<Shift> {
    let request = NSFetchRequest<Shift>(entityName: self.entityName)
    request.sortDescriptors = defaultSortDescriptors
    request.fetchBatchSize = 30
    return request
  }

  static var entityName: String {
    return "Shift"
  }
}
