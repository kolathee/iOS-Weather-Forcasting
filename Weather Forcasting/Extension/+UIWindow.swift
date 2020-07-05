//
//  +UIWindow.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit

extension UIWindow {
  
  static var key: UIWindow! {
    
    if #available(iOS 13, *) {
      guard let keyWindow = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else {
        return UIApplication.shared.windows.first
      }
      return keyWindow
      
    } else {
      
      guard let keyWindow = UIApplication.shared.keyWindow else {
        return UIApplication.shared.windows.first
      }
      return keyWindow
    }
  }
}
