//
//  Position.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData
import UIKit

final class Position: NSManagedObject {

  @NSManaged public var name: String
  @NSManaged public var color: UIColor
  @NSManaged public var shifts: Set<Shift>
}
