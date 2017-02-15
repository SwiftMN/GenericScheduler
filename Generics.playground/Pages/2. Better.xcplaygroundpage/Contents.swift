//: [Previous](@previous)

import UIKit
import PlaygroundSupport

final class MyTableViewController<T>: UITableViewController {
  typealias Configurator = (UITableViewCell, T) -> ()

  private let identifier: String
  private let data: [T]
  var configure: Configurator?

  init(dataSource: [T], identifier: String) {
    data = dataSource
    self.identifier = identifier
    super.init(style: .grouped)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    configure?(cell, data[indexPath.row])
    return cell;
  }
}

struct Movie {
  let title: String
  let rating: Int
}

let movies = [Movie(title: "The Big Lebowski", rating: 5), Movie(title: "Batman Begins", rating: 5), Movie(title: "True Romance", rating: 5), Movie(title: "The Green Mile", rating: 5)]
let cellIdentifier = "MovieCell"

let tableView = MyTableViewController<Movie>(dataSource: movies, identifier: cellIdentifier)
tableView.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

tableView.configure =  { cell, movie in
  cell.textLabel?.text = movie.title
  cell.detailTextLabel?.text = "\(movie.rating) stars"
}

PlaygroundPage.current.liveView = tableView.view
tableView.tableView.reloadData()

//: [Next](@next)
