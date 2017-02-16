//
//  NotificationExampleViewController.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 2/16/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit

final class NotificationExampleViewController: UIViewController {

  private var keyboardSpectator: NotificationSpectator?
  private var keyboardHidingSpectator: NotificationSpectator?

  @IBOutlet weak var bottom: NSLayoutConstraint!
  @IBOutlet weak var first: NSLayoutConstraint!
  @IBOutlet weak var second: NSLayoutConstraint!
  @IBOutlet weak var third: NSLayoutConstraint!

  override func viewDidLoad() {
    super.viewDidLoad()

    keyboardSpectator = NotificationCenter.default.addObserver(handler: Handlers.keyboardHandler) { (keyboard: Keyboard) in
      print(keyboard)
      UIView.animate(withDuration: keyboard.animationDuration) {
        self.bottom.constant = keyboard.endFrame.height + 10
        self.first.constant = 20
        self.second.constant = 60
        self.third.constant = 120
        self.view.layoutIfNeeded()
      }
    }

    keyboardHidingSpectator = NotificationCenter.default.addObserver(handler: Handlers.keyboardHidingHandler, using: { (keyboard: Keyboard) in
      print(keyboard)
      UIView.animate(withDuration: keyboard.animationDuration) {
        self.bottom.constant = 20
        self.first.constant = 8
        self.second.constant = 8
        self.third.constant = 8
        self.view.layoutIfNeeded()
      }
    })

    configureGestures()
  }

  private func configureGestures() {

    let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(gesture:)))
    singleTap.numberOfTapsRequired = 1;

    let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(gesture:)))
    doubleTap.numberOfTapsRequired = 2;

    view.addGestureRecognizer(singleTap)
    view.addGestureRecognizer(doubleTap)
  }

  @objc private func handleSingleTap(gesture: UITapGestureRecognizer) {
    view.endEditing(true)
  }

  @objc private func handleDoubleTap(gesture: UITapGestureRecognizer) {
    dismiss(animated: true, completion: nil)
  }
}
