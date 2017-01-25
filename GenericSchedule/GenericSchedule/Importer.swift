//
//  Importer.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import CoreData
import UIKit

class Importer: ManagedObjectContextFetchable {

  var managedObjectContext: NSManagedObjectContext

  required init(context: NSManagedObjectContext) {
    managedObjectContext = context
  }

  func load() {
    let positionRepository = Repository<Position>(context: managedObjectContext)
    let shiftRepository = Repository<Shift>(context: managedObjectContext)
    let employeeRepository = Repository<Employee>(context: managedObjectContext)
    let locationRepository = Repository<Location>(context: managedObjectContext)

    //MARK: Positions

    let ghostbuster = positionRepository.new()
    ghostbuster.name = "Ghostbuster"
    ghostbuster.color = .green

    let scientist = positionRepository.new()
    scientist.name = "Scientist"
    scientist.color = .purple

    let receptionist = positionRepository.new()
    receptionist.name = "Receptionist"
    receptionist.color = .red

    let intern = positionRepository.new()
    intern.name = "Intern"
    intern.color = .yellow

    let mechanic = positionRepository.new()
    mechanic.name = "Mechanic"
    mechanic.color = .black

    let parapsychologist = positionRepository.new()
    parapsychologist.name = "Parapsychologist"
    parapsychologist.color = .purple

    let labRat = positionRepository.new()
    labRat.name = "Lab Rat"
    labRat.color = .orange

    //MARK: Locations

    let wheniwork = locationRepository.new()
    wheniwork.name = "When I Work"
    wheniwork.latitude = 44.983579
    wheniwork.longitude = -93.277544

    let surly = locationRepository.new()
    surly.name = "Surly Taproom"
    surly.latitude = 44.973229
    surly.longitude = -93.209766

    let moa = locationRepository.new()
    moa.name = "Mall of America"
    moa.latitude = 44.854804
    moa.longitude = -93.241696

    let punch = locationRepository.new()
    punch.name = "Punch Pizza"
    punch.latitude = 44.920277
    punch.longitude = -93.186939

    let hellsKitchen = locationRepository.new()
    hellsKitchen.name = "Hell's Kitchen"
    hellsKitchen.latitude = 44.974606
    hellsKitchen.longitude = -93.272598

    let fitzgerald = locationRepository.new()
    fitzgerald.name = "Fitzgerald Theater"
    fitzgerald.latitude = 44.949080
    fitzgerald.longitude = -93.097408

    let warden = locationRepository.new()
    warden.name = "Warden’s House"
    warden.latitude = 45.061652
    warden.longitude = -92.807578

    let forepaughs = locationRepository.new()
    forepaughs.name = "Forepaughs"
    forepaughs.latitude = 44.941027
    forepaughs.longitude = -93.103947

    let firstAve = locationRepository.new()
    firstAve.name = "First Avenue"
    firstAve.latitude = 44.978266
    firstAve.longitude = -93.276081

    //MARK: Employees

    let peter = employeeRepository.new()
    peter.firstName = "Peter"
    peter.lastName = "Venkman"
    if let image = UIImage(named: "Peter"), let data = UIImagePNGRepresentation(image) {
      peter.imageData = data
    }

    let ray = employeeRepository.new()
    ray.firstName = "Ray"
    ray.lastName = "Stantz"
    if let image = UIImage(named: "Ray"), let data = UIImagePNGRepresentation(image) {
      ray.imageData = data
    }

    let egon = employeeRepository.new()
    egon.firstName = "Egon"
    egon.lastName = "Spengler"
    if let image = UIImage(named: "Egon"), let data = UIImagePNGRepresentation(image) {
      egon.imageData = data
    }

    let winston = employeeRepository.new()
    winston.firstName = "Winston"
    winston.lastName = "Zeddemore"
    if let image = UIImage(named: "Winston"), let data = UIImagePNGRepresentation(image) {
      winston.imageData = data
    }

    let janine = employeeRepository.new()
    janine.firstName = "Janine"
    janine.lastName = "Melnitz"
    if let image = UIImage(named: "Janine"), let data = UIImagePNGRepresentation(image) {
      janine.imageData = data
    }

    let louis = employeeRepository.new()
    louis.firstName = "Louis"
    louis.lastName = "Tully"
    if let image = UIImage(named: "Louis"), let data = UIImagePNGRepresentation(image) {
      louis.imageData = data
    }

    let abby = employeeRepository.new()
    abby.firstName = "Abby"
    abby.lastName = "Yates"
    if let image = UIImage(named: "Abby"), let data = UIImagePNGRepresentation(image) {
      abby.imageData = data
    }

    let erin = employeeRepository.new()
    erin.firstName = "Erin"
    erin.lastName = "Gilbert"
    if let image = UIImage(named: "Erin"), let data = UIImagePNGRepresentation(image) {
      erin.imageData = data
    }

    let jillian = employeeRepository.new()
    jillian.firstName = "Jillian"
    jillian.lastName = "Holtzmann"
    if let image = UIImage(named: "Jillian"), let data = UIImagePNGRepresentation(image) {
      jillian.imageData = data
    }

    let patty = employeeRepository.new()
    patty.firstName = "Patty"
    patty.lastName = "Tolan"
    if let image = UIImage(named: "Patty"), let data = UIImagePNGRepresentation(image) {
      patty.imageData = data
    }

    let kevin = employeeRepository.new()
    kevin.firstName = "Kevin"
    kevin.lastName = "Beckman"
    if let image = UIImage(named: "Kevin"), let data = UIImagePNGRepresentation(image) {
      kevin.imageData = data
    }

    //MARK: Shifts
    let now = Date()
    let minute = 60.0
    let hour = 3600.0

    let shift1 = shiftRepository.new()
    shift1.notes = "Bust some ghosts"
    shift1.start = now
    shift1.end = now.addingTimeInterval(minute * 45)

    let shift2 = shiftRepository.new()
    shift2.start = now.addingTimeInterval(hour * 2)
    shift2.end = now.addingTimeInterval(hour * 4)

    let shift3 = shiftRepository.new()
    shift3.notes = "Get paid this time"
    shift3.start = now.addingTimeInterval(hour * 1)
    shift3.end = now.addingTimeInterval(hour * 6)

    let shift4 = shiftRepository.new()
    shift4.notes = "Check the closet"
    shift4.start = now.addingTimeInterval(hour * 2)
    shift4.end = now.addingTimeInterval(hour * 6)

    let shift5 = shiftRepository.new()
    shift5.start = now.addingTimeInterval(minute * 30)
    shift5.end = now.addingTimeInterval(hour * 5)

    let shift6 = shiftRepository.new()
    shift6.start = now.addingTimeInterval(minute * 30)
    shift6.end = now.addingTimeInterval(hour * 5)

    let shift7 = shiftRepository.new()
    shift7.start = now.addingTimeInterval(minute * 25)
    shift7.end = now.addingTimeInterval(hour * 7)

    let shift8 = shiftRepository.new()
    shift8.start = now.addingTimeInterval(minute * 1)
    shift8.end = now.addingTimeInterval(hour * 7)

    let shift9 = shiftRepository.new()
    shift9.start = now.addingTimeInterval(hour * 2)
    shift9.end = now.addingTimeInterval(hour * 5)

    let shift10 = shiftRepository.new()
    shift10.start = now.addingTimeInterval(hour * 3)
    shift10.end = now.addingTimeInterval(hour * 9)

    //MARK: Relationships

    let shifts = Set<Shift>([shift1, shift2, shift3, shift4, shift5, shift6, shift7])

    let employees = [peter, ray, egon, winston, janine, louis, abby, erin, jillian, patty, kevin]
    employees.forEach { $0.shifts = shifts }
    let locations = [wheniwork, surly, moa, warden, firstAve, fitzgerald, hellsKitchen, forepaughs, punch]
    locations.forEach { $0.shifts = shifts }
    let positions = [ghostbuster, scientist, parapsychologist, mechanic, receptionist, labRat, intern]
    positions.forEach { $0.shifts = shifts }

    shift1.employee = peter
    shift1.location = wheniwork
    shift1.position = ghostbuster

    shift2.employee = ray
    shift2.location = surly
    shift2.position = mechanic

    shift3.employee = egon
    shift3.location = moa
    shift3.position = scientist

    shift4.employee = winston
    shift4.location = hellsKitchen
    shift4.position = ghostbuster

    shift5.employee = louis
    shift5.location = firstAve
    shift5.position = intern

    shift6.employee = abby
    shift6.location = warden
    shift6.position = ghostbuster

    shift7.employee = kevin
    shift7.location = fitzgerald
    shift7.position = receptionist

    shift8.employee = peter
    shift8.location = punch
    shift8.position = parapsychologist

    shift9.employee = ray
    shift9.location = firstAve
    shift9.position = mechanic

    shift10.employee = jillian
    shift10.location = wheniwork
    shift10.position = labRat

    _ = positionRepository.save()
    _ = shiftRepository.save()
    _ = employeeRepository.save()
    _ = locationRepository.save()
  }
}
