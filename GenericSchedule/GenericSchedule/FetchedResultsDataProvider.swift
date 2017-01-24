//
//  FetchedResultsDataProvider.swift
//  CoreDataObjcIo
//
//  Created by Adam Ahrens on 1/2/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit
import CoreData

final class FetchedResultsDataProvider<T: NSFetchRequestResult>: NSObject, NSFetchedResultsControllerDelegate, ItemProvider {

  private let fetchedResultsController: NSFetchedResultsController<T>
  private var updates = [ItemProviderUpdate]()
  private weak var delegate: ItemProviderDelegate?

  init(fetchRequest: NSFetchRequest<T>, managedObjectContext: NSManagedObjectContext, delegate: ItemProviderDelegate) {

    self.delegate = delegate

    let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
    fetchedResultsController = frc

    super.init()

    fetchedResultsController.delegate = self
    try! fetchedResultsController.performFetch()
  }

  //MARK: ItemProvider
  func object(at: IndexPath) -> T {
    return fetchedResultsController.object(at: at)
  }

  func numberOfItems(section: Int) -> Int {
    guard let count = fetchedResultsController.sections?[section].numberOfObjects else { return 0 }
    return count
  }

  func sections() -> Int {
    guard let count = fetchedResultsController.sections?.count else { return 1 }
    return count
  }

  //MARK: NSFetchedResultsControllerDelegate
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    updates.removeAll()
  }

  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    delegate?.itemProviderDidUpdate(updates: updates)
  }

  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    guard let indexPath = indexPath else { fatalError("Index path should be not nil") }
    switch type {
    case .insert :
      updates.append(.Insert(indexPath))
    case .delete :
      updates.append(.Delete(indexPath))
    case .update :
      updates.append(.Update(indexPath))
    case .move :
      guard let newIndexPath = newIndexPath else { fatalError("New Index Path should not be nil") }
      updates.append(.Move(indexPath, newIndexPath))
    }
  }
}
