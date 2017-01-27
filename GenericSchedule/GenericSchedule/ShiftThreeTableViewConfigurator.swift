//
//  ShiftThreeTableViewConfigurator.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/25/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData
import UIKit
import MapKit
import CoreGraphics

final class ShiftThreeTableViewConfigurator: TableViewConfigurator {

  private var tableView: UITableView!

  // Used to hold MapViews that are created
  private let cache = NSCache<NSString, UIImage>()

  var cellIdentifier: String {
    return "ShiftThreeTableViewCell"
  }

  init(tableView: UITableView) {
    self.tableView = tableView
    self.tableView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    self.tableView.backgroundColor = UIColor(red:0.91, green:0.71, blue:0.51, alpha:1.0)
    self.tableView.rowHeight = 400.0
  }

  func configure<T>(cell: UITableViewCell, with: T) {
    guard let shiftCell = cell as? ShiftThreeTableViewCell, let shift = with as? Shift else { return }

    shiftCell.contentView.backgroundColor = UIColor(red:0.91, green:0.71, blue:0.51, alpha:0.7)
    shiftCell.containerView.backgroundColor = UIColor(red:0.91, green:0.71, blue:0.51, alpha:0.7)

    shiftCell.shiftDescriptionLabel.text = "\(shift.employee.fullName) works as \(shift.position.name) at \(shift.location.name) on \(DateFormatters.simplerDate.string(from: shift.start))"

    // Check Cache
    if let image = cache.object(forKey: shift.location.cacheKey) {
      shiftCell.mapImageView.image = image
      return
    }

    // Generate MapSnapshot
    let options = MKMapSnapshotOptions()
    let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.0007, longitudeDelta: 0.0007)
    let region = MKCoordinateRegion(center: shift.location.coordinate, span: coordinateSpan)
    options.region = region
    options.size = shiftCell.mapImageView.frame.size
    let snapshot = MKMapSnapshotter(options: options)

    snapshot.start(with: DispatchQueue.global(qos: .userInitiated)) { [unowned self] mapSnapshot, error in
      if let error = error {
        print("Error creating MapSnapshot \(error)")
      }

      if let image = mapSnapshot?.image, let point = mapSnapshot?.point(for: shift.location.coordinate) {

        // Draw circle
        UIGraphicsBeginImageContextWithOptions(image.size, false, UIScreen.main.scale)
        image.draw(at: .zero)
        let circle = UIBezierPath(ovalIn: CGRect(x: point.x, y: point.y, width: 40, height: 40))
        circle.move(to: point)
        let fillColor = UIColor(red:0.91, green:0.71, blue:0.51, alpha:0.7)
        fillColor.setFill()
        circle.fill()
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // Cache
        if let newImage = newImage {
          self.cache.setObject(newImage, forKey: shift.location.cacheKey)

          DispatchQueue.main.async {
            shiftCell.mapImageView.image = newImage
          }
        }
      }
    }
  }
}
