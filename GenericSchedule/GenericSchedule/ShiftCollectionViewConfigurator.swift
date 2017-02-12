//
//  ShiftCollectionViewConfigurator.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/27/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit
import MapKit

final class ShiftCollectionViewConfigurator: CollectionViewConfigurator {

  private var collectionView: UICollectionView!

  // Used to hold MapViews that are created
  private let cache = NSCache<NSString, UIImage>()

  var cellIdentifier: String {
    return "ShiftCollectionViewCell"
  }

  init(collectionView: UICollectionView) {
    self.collectionView = collectionView
    self.collectionView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    self.collectionView.backgroundColor = UIColor(red:0.23, green:0.40, blue:0.62, alpha:1.0)

    // Lets size the cell to fit the screen
    if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {

      let width = collectionView.frame.size.width * 0.9
      let height = collectionView.frame.size.height * 0.98
      layout.itemSize = CGSize(width: width, height: height)
    }
  }

  func configure<T>(cell: UICollectionViewCell, with: T) {
    guard let shiftCell = cell as? ShiftCollectionViewCell, let shift = with as? Shift else { return }

    shiftCell.employeeImageView.image = shift.employee.employeeImage
    shiftCell.locationLabel.text = shift.location.name
    shiftCell.positionLabel.text = "\(shift.employee.fullName) as \(shift.position.name)"
    shiftCell.hoursLabel.text = "\(DateFormatters.hoursDate.string(from: shift.start)) - \(DateFormatters.hoursDate.string(from: shift.end))"

    if let notes = shift.notes {
      shiftCell.notesLabel.text = notes
      shiftCell.notesIcon.isHidden = false
    } else {
      shiftCell.notesLabel.text = nil
      shiftCell.notesIcon.isHidden = true
    }

    shiftCell.containerView.layer.cornerRadius = 2.0
    shiftCell.employeeImageView.layer.cornerRadius = shiftCell.employeeImageView.frame.size.width / 2.0
    shiftCell.employeeImageView.layer.borderColor = UIColor.white.cgColor
    shiftCell.employeeImageView.layer.borderWidth = 2.0
    shiftCell.employeeImageView.clipsToBounds = true

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
