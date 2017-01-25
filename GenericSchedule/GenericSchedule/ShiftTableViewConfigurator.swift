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
    self.tableView.backgroundColor = UIColor(red:0.23, green:0.40, blue:0.62, alpha:1.0)
    self.tableView.rowHeight = 64.0
  }

  func configure<T>(cell: UITableViewCell, with: T) {
    guard let shiftCell = cell as? ShiftTableViewCell, let shift = with as? Shift else { return }

    shiftCell.nameLabel.text = shift.employee.fullName
    shiftCell.startLabel.text = DateFormatters.simpleDate.string(from: shift.start)

    shiftCell.backgroundColor = UIColor(red:0.23, green:0.40, blue:0.62, alpha:1.0)
    shiftCell.nameLabel.textColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
    shiftCell.startLabel.textColor = UIColor(red:0.91, green:0.71, blue:0.51, alpha:1.0)
    shiftCell.positionView.backgroundColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
  }
}
