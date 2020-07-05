//
//  ConverterTests.swift
//  Weather ForcastingTests
//
//  Created by Kolathee Payuhawattana on 25/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import XCTest
@testable import Weather_Forcasting

class ConverterTests: XCTestCase {
  
  let converter = Converter()
  
  func test_ConvertCelsiusToFahrenheit() throws {
    // Minus
    XCTAssertEqual(converter.convertToFahrenheit(celsius: -99).rounded(digits: 3), -146.2)
    
    // Zero
    XCTAssertEqual(converter.convertToFahrenheit(celsius: 0).rounded(digits: 3), 32.0)
    
    // Normal cases
    XCTAssertEqual(converter.convertToFahrenheit(celsius: 30).rounded(digits: 3), 86.0)
    XCTAssertEqual(converter.convertToFahrenheit(celsius: 43).rounded(digits: 3), 109.4)
    XCTAssertEqual(converter.convertToFahrenheit(celsius: 100).rounded(digits: 3), 212.0)
    
    // Big number
    XCTAssertEqual(converter.convertToFahrenheit(celsius: 3333).rounded(digits: 3), 6031.4)
    
    // Number with digits
    XCTAssertEqual(converter.convertToFahrenheit(celsius: 25.76).rounded(digits: 3), 78.368)
  }
  
  func test_ConvertFahrenheitToCelsius() throws {
    // Minus
    XCTAssertEqual(converter.convertToCelsius(fahrenheit: -146.2).rounded(digits: 3), -99)
    
    // Zero
    XCTAssertEqual(converter.convertToCelsius(fahrenheit: 32).rounded(digits: 3), 0)
    
    // Normal cases
    XCTAssertEqual(converter.convertToCelsius(fahrenheit: 86).rounded(digits: 3), 30)
    XCTAssertEqual(converter.convertToCelsius(fahrenheit: 109.4).rounded(digits: 3), 43)
    XCTAssertEqual(converter.convertToCelsius(fahrenheit: 212).rounded(digits: 3), 100)
    
    // Big number
    XCTAssertEqual(converter.convertToCelsius(fahrenheit: 6031.4).rounded(digits: 3), 3333)
    
    // Number with digits
    XCTAssertEqual(converter.convertToCelsius(fahrenheit: 78.368).rounded(digits: 3), 25.76)
  }
  
  func test_ConvertKelvinToOtherUnit() throws {
    // MARK: - Celsius
    
    // Negative values
    XCTAssertEqual(converter.convert(kelvin: -1200, to: .celsius).rounded(digits: 3), -1473.15)
    XCTAssertEqual(converter.convert(kelvin: -20, to: .celsius).rounded(digits: 3), -293.15)
    
    // Zero
    XCTAssertEqual(converter.convert(kelvin: 0, to: .celsius).rounded(digits: 3), -273.15)
    XCTAssertEqual(converter.convert(kelvin: 273.15, to: .celsius).rounded(digits: 3), 0)
    
    // Prositive values
    XCTAssertEqual(converter.convert(kelvin: 14, to: .celsius).rounded(digits: 3), -259.15)
    XCTAssertEqual(converter.convert(kelvin: 300, to: .celsius).rounded(digits: 3), 26.85)
    XCTAssertEqual(converter.convert(kelvin: 1000, to: .celsius).rounded(digits: 3), 726.85)
    // Digit values
    XCTAssertEqual(converter.convert(kelvin: 173.15, to: .celsius).rounded(digits: 3), -100)
    XCTAssertEqual(converter.convert(kelvin: 303.15, to: .celsius).rounded(digits: 3), 30)

    
    // MARK: - Farenheit
    
    // Negative values
    XCTAssertEqual(converter.convert(kelvin: -100, to: .fahrenheit).rounded(digits: 3), -639.67)
    XCTAssertEqual(converter.convert(kelvin: -23.42, to: .fahrenheit).rounded(digits: 3), -501.826)
    
    // Zero
    XCTAssertEqual(converter.convert(kelvin: 0, to: .fahrenheit).rounded(digits: 3), -459.67)
    XCTAssertEqual(converter.convert(kelvin: 255.372, to: .fahrenheit).rounded(digits: 3), 0)
    
    // Positive values
    XCTAssertEqual(converter.convert(kelvin: 100, to: .fahrenheit).rounded(digits: 3), -279.67)
    XCTAssertEqual(converter.convert(kelvin: 260, to: .fahrenheit).rounded(digits: 3), 8.33)
    // Digit values
    XCTAssertEqual(converter.convert(kelvin: 310.928, to: .fahrenheit).rounded(digits: 3), 100)
    XCTAssertEqual(converter.convert(kelvin: 383.706, to: .fahrenheit).rounded(digits: 3), 231.001)
  }
}

