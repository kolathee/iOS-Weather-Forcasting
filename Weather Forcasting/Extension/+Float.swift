//
//  +Float.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 23/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import Foundation

extension Float {
  
  func roundToPlaces(_ places: Int) -> String {
    return String(format: "%.\(places)f", self)
  }
  
  func rounded(digits: Int) -> Float {
    let multiplier = pow(10.0, Float(digits))
    return (self * multiplier).rounded() / multiplier
  }
}
