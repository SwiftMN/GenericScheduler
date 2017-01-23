//
//  Location.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData

final class Location: NSManagedObject {

  @NSManaged public var latitude: Float
  @NSManaged public var longitude: Float
  @NSManaged public var name: String
  @NSManaged public var shifts: Set<Shift>
}
