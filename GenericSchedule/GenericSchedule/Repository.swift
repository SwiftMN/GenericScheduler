//
//  PositionRepository.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData

final class Repository<T: NSManagedObject> : RepositoryProtcol {

  var managedObjectContext: NSManagedObjectContext

  required init(context: NSManagedObjectContext) {
    managedObjectContext = context
  }

  func new() -> T {
    return T(context: managedObjectContext)
  }

  func delete(object: T) {
    managedObjectContext.delete(object)
    _ = save()
  }
  
  func save() -> Bool {
    guard managedObjectContext.hasChanges else { return false }
    var result = false
    do {
      try managedObjectContext.save()
      result = true
      print("Saving successful")
    } catch let error as NSError {
      print("Error saving context \(error), \(error.userInfo)")
    }

    return result
  }
}
