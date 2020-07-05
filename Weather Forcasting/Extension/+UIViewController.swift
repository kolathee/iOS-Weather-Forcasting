//
//  +UIViewController.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 27/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func navigateBack() {
    guard let navigationController = self.navigationController else { return }
    navigationController.popViewController(animated: true)
  }
}
