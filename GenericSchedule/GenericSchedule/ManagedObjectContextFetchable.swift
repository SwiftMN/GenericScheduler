//
//  MangedObjectContextSettable.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData

protocol ManagedObjectContextFetchable: class {
  var managedObjectContext: NSManagedObjectContext { get set }
  init(context: NSManagedObjectContext)
}
