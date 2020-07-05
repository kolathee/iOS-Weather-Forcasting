//
//  Converter.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 25/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import Foundation

class Converter {
  
  func convertToCelsius(fahrenheit: Float) -> Float {
    return (fahrenheit - 32) * (5.0 / 9.0)
  }
  
  func convertToFahrenheit(celsius: Float) -> Float {
    return ((celsius * 9.0) / 5.0) + 32
  }
  
  func convert(kelvin: Float, to unit: TempUnit) -> Float {
    switch unit {
      case .celsius:
        return kelvin - 273.15
      case .fahrenheit:
        let celsius = convert(kelvin: kelvin, to: .celsius)
        return convertToFahrenheit(celsius: celsius)
    }
  }
}
