//
//  TableViewDataSource.swift
//  CoreDataObjcIo
//
//  Created by Adam Ahrens on 1/3/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit
import CoreData

final class TableViewDataSource<T: NSFetchRequestResult>: NSObject, UITableViewDataSource {

  private var dataProvider: FetchedResultsDataProvider<T>!
  private var tableView: UITableView!
  private var configurator: TableViewConfigurator!

  init(tableView: UITableView, dataProvider: FetchedResultsDataProvider<T>, configurator: TableViewConfigurator) {
    super.init()
    self.tableView = tableView
    self.tableView.dataSource = self
    self.dataProvider = dataProvider
    self.configurator = configurator
  }

  //MARK: UITableViewDataSource
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: configurator.cellIdentifier, for: indexPath)
    let object = dataProvider.object(at: indexPath)
    configurator.configure(cell: cell, with: object)
    return cell
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataProvider.numberOfItems(section: section)
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return dataProvider.sections()
  }

  //MARK: Public

  func processUpdates(updates: [ItemProviderUpdate]?) {
    guard let updates = updates, updates.count > 0 else { return }

    tableView.beginUpdates()

    for update in updates {
      switch update {
      case .Delete(let indexPath) :
        tableView.deleteRows(at: [indexPath], with: .fade)
      case .Insert(let indexPath) :
        tableView.insertRows(at: [indexPath], with: .automatic)
      case .Move(let fromPath, let toPath) :
        tableView.moveRow(at: fromPath, to: toPath)
      case .Update(let indexPath) :
        tableView.reloadRows(at: [indexPath], with: .automatic)
      }
    }

    tableView.endUpdates()
  }
}
