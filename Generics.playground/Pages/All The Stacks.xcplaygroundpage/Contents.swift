//: [Previous](@previous)

import Foundation

protocol Chainable {
  associatedtype T
  func enqueue(element: T)
  func dequeue() -> T?
  func isEmpty() -> Bool
  func peek() -> T?
}

class Node<T> : CustomStringConvertible {
  var data: T
  var next: Node?
  var previous: Node?

  init(data: T) {
    self.data = data
  }

  var description: String {
    var node = ""

    if let _ = previous {
      node += "<-"
    }

    node += "\(data)"

    if let _ = next {
      node += "->"
    }

    return node
  }
}

class Stack<T>: Chainable, CustomStringConvertible {
  private var top: Node<T>?
  private var size = 0

  var description: String {
    var result = "---- Top ----\n"
    var start = top

    while start != nil {
      if let data = start?.data {
        result += "\(data)\n"
      }

      start = start?.next
    }
    result += "--  Bottom --\n\n"
    return result
  }

  func enqueue(element: T) {
    let toEnqueue = Node(data: element)

    if size == 0 {
      top = toEnqueue
    } else {
      toEnqueue.next = top
      top?.previous = toEnqueue
      top = toEnqueue
    }

    size += 1
  }

  func dequeue() -> T? {
    guard let top = top else { return nil }
    let removed = top.data
    top.next?.previous = nil
    self.top = top.next
    size -= 1
    return removed
  }

  func isEmpty() -> Bool {
    return top == nil
  }

  func peek() -> T? {
    return top?.data
  }
}

let stack = Stack<String>()
stack.enqueue(element: "Last")
stack.enqueue(element: "Second")
stack.enqueue(element: "First")

let stackOther = Stack<Int>()
stackOther.enqueue(element: 1)

print(stack)
print(stackOther)
//: [Next](@next)
