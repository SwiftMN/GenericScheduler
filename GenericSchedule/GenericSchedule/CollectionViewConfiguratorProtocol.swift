//
//  CollectionViewConfiguratorProtocol.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/27/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit

protocol CollectionViewConfigurator {
  var cellIdentifier: String { get }
  init(collectionView: UICollectionView)
  func configure<T>(cell: UICollectionViewCell, with: T)
}
