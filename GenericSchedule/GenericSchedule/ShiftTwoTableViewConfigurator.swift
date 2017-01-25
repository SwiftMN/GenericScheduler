//
//  ShiftTwoTableViewConfigurator.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/25/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData
import UIKit

final class ShiftTwoTableViewConfigurator: TableViewConfigurator {

  private var tableView: UITableView!

  var cellIdentifier: String {
    return "ShiftTwoTableViewCell"
  }

  init(tableView: UITableView) {
    self.tableView = tableView
    self.tableView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    self.tableView.backgroundColor = UIColor(red:0.52, green:0.57, blue:0.66, alpha:1.0)
    self.tableView.rowHeight = 100.0
  }

  func configure<T>(cell: UITableViewCell, with: T) {
    guard let shiftCell = cell as? ShiftTwoTableViewCell, let shift = with as? Shift else { return }

    shiftCell.positionView.backgroundColor = shift.position.color
    shiftCell.locationLabel.text = "@ \(shift.location.latitude), \(shift.location.longitude)"
    shiftCell.initialsLabel.text = shift.employee.initials
    shiftCell.employeeImageView.image = shift.employee.employeeImage
    shiftCell.dateLabel.text = DateFormatters.startOnDate.string(from: shift.start)

    shiftCell.backgroundColor = UIColor(red:0.52, green:0.57, blue:0.66, alpha:1.0)
    shiftCell.locationLabel.textColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
    shiftCell.dateLabel.textColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
    shiftCell.initialsLabel.textColor = UIColor(red:0.91, green:0.71, blue:0.51, alpha:1.0)

    shiftCell.employeeImageView.clipsToBounds = true
    shiftCell.employeeImageView.layer.cornerRadius = 20
    shiftCell.employeeImageView.layer.borderWidth = 3
    shiftCell.employeeImageView.layer.borderColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0).cgColor
  }
}
