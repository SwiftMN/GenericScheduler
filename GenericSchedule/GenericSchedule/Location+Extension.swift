//
//  Location+Extension.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData
import MapKit

extension Location: ManagedObject, MKAnnotation {
  static var defaultSortDescriptors: [NSSortDescriptor] {
    let sort = NSSortDescriptor(key: #keyPath(Location.name), ascending: false)
    return [sort]
  }

  static var defaultFetchRequest: NSFetchRequest<Location> {
    let request = NSFetchRequest<Location>(entityName: self.entityName)
    request.sortDescriptors = defaultSortDescriptors
    request.fetchBatchSize = 30
    return request
  }

  static var entityName: String {
    return "Location"
  }

  var coordinate: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
  }

  var cacheKey: NSString  {
    return NSString(string: "\(latitude),\(longitude)")
  }
}
