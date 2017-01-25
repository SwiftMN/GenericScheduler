//
//  Employee+Extension.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData
import UIKit

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

  var initials: String {
    let firstIndex =  firstName.index(firstName.startIndex, offsetBy: 1)
    let firstInitial = firstName.substring(to: firstIndex).uppercased()
    let secondIndex =  lastName.index(lastName.startIndex, offsetBy: 1)
    let secondInitial = lastName.substring(to: secondIndex).uppercased()
    return "\(firstInitial).\(secondInitial)"
  }

  var employeeImage: UIImage? {
    return UIImage(data: imageData)
  }
}
