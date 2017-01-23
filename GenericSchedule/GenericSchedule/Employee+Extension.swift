//
//  Employee+Extension.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData

extension Employee: ManagedObject {
  static var defaultSortDescriptors: [NSSortDescriptor] {
    let first = NSSortDescriptor(key: #keyPath(Employee.firstName), ascending: false)
    let second = NSSortDescriptor(key: #keyPath(Employee.lastName), ascending: false)
    return [first, second]
  }

  static var defaultFetchRequest: NSFetchRequest<Employee> {
    let request = NSFetchRequest<Employee>(entityName: self.entityName)
    request.sortDescriptors = defaultSortDescriptors
    request.fetchBatchSize = 30
    return request
  }

  static var entityName: String {
    return "Employee"
  }

  var fullName: String {
    return "\(firstName) \(lastName)"
  }
}
