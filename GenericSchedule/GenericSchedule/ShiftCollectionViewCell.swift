//
//  ShiftCollectionViewCell.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/26/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit

final class ShiftCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var employeeImageView: UIImageView!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var mapImageView: UIImageView!
  @IBOutlet weak var positionLabel: UILabel!
  @IBOutlet weak var hoursLabel: UILabel!
  @IBOutlet weak var notesIcon: UIImageView!
  @IBOutlet weak var notesLabel: UILabel!
}
