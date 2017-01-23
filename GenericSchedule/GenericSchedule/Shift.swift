//
//  Shift.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData

final class Shift: NSManagedObject {

  @NSManaged public var start: Date
  @NSManaged public var end: Date
  @NSManaged public var notes: String?
  @NSManaged public var employee: Employee
  @NSManaged public var location: Location
  @NSManaged public var position: Position
}
