//
//  TableViewConfiguratorProtocol.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit

protocol TableViewConfigurator {
  var cellIdentifier: String { get }
  init(tableView: UITableView)
  func configure<T>(cell: UITableViewCell, with: T)
}
