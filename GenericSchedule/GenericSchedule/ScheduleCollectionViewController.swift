//
//  ScheduleCollectionViewController.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/27/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit

final class ScheduleCollectionViewController: UIViewController, ItemProviderDelegate {

  private var dataSource: CollectionViewDataSource<Shift>!

  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let configurator = ShiftCollectionViewConfigurator(collectionView: collectionView)
    let dataProvider = FetchedResultsDataProvider<Shift>(fetchRequest: Shift.defaultFetchRequest, managedObjectContext: CoreDataStack.stack.mainManagedObjectContext, delegate: self)
    dataSource = CollectionViewDataSource<Shift>(collectionView: collectionView, dataProvider: dataProvider, configurator: configurator)
  }

  //MARK: ItemProviderDelegate
  func itemProviderDidUpdate(updates: [ItemProviderUpdate]?) {
    dataSource.processUpdates(updates: updates)
  }
}
