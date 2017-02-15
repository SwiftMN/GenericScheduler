//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

final class MyTableViewController: UITableViewController {
  private let identifier: String
  private let data: [String]

  init(dataSource: [String], identifier: String) {
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
    cell.textLabel?.text = data[indexPath.row]
    return cell;
  }
}

let movies = ["The Big Lebowski", "John Wick", "Rambo", "Batman Begins"]
let cellIdentifier = "MovieCell"

let tableView = MyTableViewController(dataSource: movies, identifier: cellIdentifier)
tableView.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
PlaygroundPage.current.liveView = tableView.view