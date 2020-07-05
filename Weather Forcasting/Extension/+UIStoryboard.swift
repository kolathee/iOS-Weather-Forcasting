//
//  +UIStoryboard.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit

protocol ReusableViewController {
  static var reuseID: String {get}
}

extension ReusableViewController {
  static var reuseID: String {
    return String(describing: self)
  }
}

extension UIViewController: ReusableViewController {}

extension UIStoryboard {
  
  func instantiateViewController<T>(ofType type: T.Type = T.self) -> T where T: UIViewController {
    guard let viewController = instantiateViewController(withIdentifier: type.reuseID) as? T else {
      fatalError()
    }
    return viewController
  }
}
