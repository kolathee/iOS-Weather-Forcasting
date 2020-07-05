//
//  CurrentWeatherTests.swift
//  Weather ForcastingTests
//
//  Created by Kolathee Payuhawattana on 25/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxCocoa
@testable import Weather_Forcasting

class CurrentWeatherTests: XCTestCase {
  var currentWeatherVM: CurrentWeatherVM!
  var scheduler: TestScheduler!
  var disposeBag: DisposeBag!
  
  override func setUpWithError() throws {
    scheduler = TestScheduler(initialClock: 0)
    disposeBag = DisposeBag()
    currentWeatherVM = CurrentWeatherVM()
  }
  
  func test_SwitchingTemperatureUnits() throws {
    // Celsius to Fahrenheit
    currentWeatherVM.currentUnit.accept(.celsius)
    currentWeatherVM.switchUnit()
    XCTAssertEqual(currentWeatherVM.currentUnit.value, .fahrenheit)
    
    // Fahrenheit to Celsius
    currentWeatherVM.currentUnit.accept(.fahrenheit)
    currentWeatherVM.switchUnit()
    XCTAssertEqual(currentWeatherVM.currentUnit.value, .celsius)
  }
  
  func test_CanTapRightArrowButtonObservable_WhenCityNamesProvided() throws {
    // Create a "TESTABLE" observer
    let canTapRightArrowButton = scheduler.createObserver(Bool.self)
    
    // Drive output in VM into the testable observer
    currentWeatherVM.canTapRightArrowButton
      .bind(to: canTapRightArrowButton)
      .disposed(by: disposeBag)
    
    // Mock emitting events (changing city's name)
    scheduler.createColdObservable([.next(10, "New york"),
                                    .next(20, "London"),
                                    .next(30, "Bangkok"),
                                    .next(40, "Taiwan")])
      .bind(to: currentWeatherVM.cityName)
      .disposed(by: disposeBag)
    
    // Start emitting
    scheduler.start()
    
    // Expect these results
    XCTAssertEqual(canTapRightArrowButton.events, [
      .next(0, false),
      .next(10, true),
      .next(20, true),
      .next(30, true),
      .next(40, true)
    ])
  }
  
  func test_CanTapRightArrowButtonObservable_WhenChangingCityNames() throws {
    // Create a "TESTABLE" observer
    let canTapRightArrowButton = scheduler.createObserver(Bool.self)
    
    // Drive output in VM into the testable observer
    currentWeatherVM.canTapRightArrowButton
      .bind(to: canTapRightArrowButton)
      .disposed(by: disposeBag)
    
    // Mock emitting events (changing city's name)
    scheduler.createColdObservable([.next(10, "London"),
                                    .next(20, ""),
                                    .next(30, ""),
                                    .next(40, "Thailand"),
                                    .next(50, "")])
      .bind(to: currentWeatherVM.cityName)
      .disposed(by: disposeBag)
    
    // Start emitting
    scheduler.start()
    
    // Expect these results
    XCTAssertEqual(canTapRightArrowButton.events, [.next(0, false),
                                                   .next(10, true),
                                                   .next(20, false),
                                                   .next(30, false),
                                                   .next(40, true),
                                                   .next(50, false)])
  }
  
  func test_CityNameValidity_ValidWhenTheNameIsNotEmpty() {
    // Create a "TESTABLE" observer
    let isCityNameValid = scheduler.createObserver(Bool.self)
    
    // Drive output in VM into the testable observer
    currentWeatherVM.isCityNameValid
      .asObservable()
      .bind(to: isCityNameValid)
      .disposed(by: disposeBag)
    
    // Mock emitting events
    scheduler.createColdObservable([.next(10, ""),
                                    .next(20, "Los angeles"),
                                    .next(30, "Texas"),
                                    .next(40, ""),
                                    .next(50, "Hello")])
      .bind(to: currentWeatherVM.cityName)
      .disposed(by: disposeBag)
    
    // Start emitting
    scheduler.start()
    
    // Expect these results
    XCTAssertEqual(isCityNameValid.events, [.next(0, false),
                                            .next(10, false),
                                            .next(20, true),
                                            .next(30, true),
                                            .next(40, false),
                                            .next(50, true)])
  }
}
