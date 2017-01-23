//
//  CoreDataStack.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData

class CoreDataStack: NSObject {

  private let modelName: String

  private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: self.modelName)
    container.loadPersistentStores { description, error in
      if let error = error as NSError? {
        print("Unresolved error \(error), \(error.userInfo)")
      }
    }

    return container
  }()

  lazy var mainManagedObjectContext: NSManagedObjectContext = {
    return self.persistentContainer.viewContext
  }()

  static let stack = CoreDataStack(modelName: "Scheduler")

  private init(modelName: String) {
    self.modelName = modelName

    super.init()

    NotificationCenter.default.addObserver(self, selector: #selector(CoreDataStack.save), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)

    NotificationCenter.default.addObserver(self, selector: #selector(CoreDataStack.save), name: NSNotification.Name.UIApplicationWillTerminate, object: nil)
  }

  func save() {
    guard mainManagedObjectContext.hasChanges else { return }

    do {
      try mainManagedObjectContext.save()
      print("Saving successful")
    } catch let error as NSError {
      print("Error saving context \(error), \(error.userInfo)")
    }
  }
}
