//
//  CollectionViewDataSource.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/27/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit
import CoreData

final class CollectionViewDataSource<T: NSFetchRequestResult>: NSObject, UICollectionViewDataSource {

  private var dataProvider: FetchedResultsDataProvider<T>!
  private var collectionView: UICollectionView!
  private var configurator: CollectionViewConfigurator!

  init(collectionView: UICollectionView, dataProvider: FetchedResultsDataProvider<T>, configurator: CollectionViewConfigurator) {
    super.init()
    self.collectionView = collectionView
    self.collectionView.dataSource = self
    self.dataProvider = dataProvider
    self.configurator = configurator
  }
  
  //MARK: UICollectionViewDataSource

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return dataProvider.sections()
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataProvider.numberOfItems(section: section)
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: configurator.cellIdentifier, for: indexPath)
    let object = dataProvider.object(at: indexPath)
    configurator.configure(cell: cell, with: object)
    return cell
  }

  //MARK: Public

  func processUpdates(updates: [ItemProviderUpdate]?) {
    guard let updates = updates, updates.count > 0 else { return }

    collectionView.performBatchUpdates({ [weak self] in
      for update in updates {
        switch update {
        case .Delete(let indexPath) :
          self?.collectionView.deleteItems(at: [indexPath])
        case .Insert(let indexPath) :
          self?.collectionView.insertItems(at: [indexPath])
        case .Move(let fromPath, let toPath) :
          self?.collectionView.moveItem(at: fromPath, to: toPath)
        case .Update(let indexPath) :
          self?.collectionView.reloadItems(at: [indexPath])
        }
      }
    }, completion: nil)
  }
}
