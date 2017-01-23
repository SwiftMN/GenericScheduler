//
//  Employee.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData

final class Employee: NSManagedObject {
  
  @NSManaged public var firstName: String
  @NSManaged public var lastName: String
  @NSManaged public var imageData: Data
  @NSManaged public var shifts: Set<Shift>
}
