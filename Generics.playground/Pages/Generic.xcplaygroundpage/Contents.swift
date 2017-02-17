//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

struct Movie {
  let title: String
  let rating: Int
}

let movies = [Movie(title: "The Big Lebowski", rating: 5), Movie(title: "Batman Begins", rating: 5), Movie(title: "True Romance", rating: 5), Movie(title: "The Green Mile", rating: 5)]
let cellIdentifier = "MovieCell"

final class MovieCell: UITableViewCell {

  var magic: Bool?
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

final class GenericTableViewController<T, C: UITableViewCell>: UITableViewController {

  typealias Configurator = (C, T) -> ()
  typealias Selection = (T) -> ()

  private let identifier: String
  private let data: [T]
  var configure: Configurator?
  var selection: Selection?

  init(data: [T], identifier: String) {
    self.data = data
    self.identifier = identifier
    super.init(style: .grouped)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(C.self, forCellReuseIdentifier: identifier)
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! C
    configure?(cell, data[indexPath.row])
    return cell;
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selection?(data[indexPath.row])
  }
}

// TableView that supports Strings
let tableView = GenericTableViewController<Movie, MovieCell>(data: movies, identifier: cellIdentifier)

tableView.configure =  { cell, movie in
  cell.textLabel?.text = movie.title
  cell.detailTextLabel?.text = "\(movie.rating) stars"
  cell.backgroundColor = .blue
  cell.textLabel?.textColor = .white
  cell.detailTextLabel?.textColor = .white
  cell.magic = true
}

tableView.selection = { movie in
  print("Selected \(movie)")
}

tableView.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
PlaygroundPage.current.liveView = tableView.view
tableView.tableView.reloadData()
