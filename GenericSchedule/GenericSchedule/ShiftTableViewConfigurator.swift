//
//  ShiftTableViewConfigurator.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData
import UIKit

final class ShiftTableViewConfigurator: TableViewConfigurator {

  private var tableView: UITableView!

  var cellIdentifier: String {
    return "ShiftTableViewCell"
  }
  
  init(tableView: UITableView) {
    self.tableView = tableView
    self.tableView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
  }

  func configure<T>(cell: UITableViewCell, with: T) {
    guard let shiftCell = cell as? ShiftTableViewCell, let shift = with as? Shift else { return }

    shiftCell.nameLabel.text = shift.employee.fullName
    shiftCell.positionView.backgroundColor = shift.position.color
    shiftCell.startLabel.text = shift.start.description
  }
}
