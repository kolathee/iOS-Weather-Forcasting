//
//  WeatherForecastTests.swift
//  Weather ForcastingTests
//
//  Created by Kolathee Payuhawattana on 27/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxCocoa
@testable import Weather_Forcasting

class WeatherForecastTests: XCTestCase {
  var weatherForecastVM: WeatherForecastVM!
  var scheduler: TestScheduler!
  var disposeBag: DisposeBag!
  
  override func setUpWithError() throws {
    scheduler = TestScheduler(initialClock: 0)
    disposeBag = DisposeBag()
    weatherForecastVM = WeatherForecastVM()
  }
  
  func test_ClearWeatherData() {
    weatherForecastVM.cityName.accept("Bangkok")
    let day1 = List()
    let day2 = List()
    let day3 = List()
    weatherForecastVM.weatherList.accept([day1, day2, day3])
    
    // MARK: Clear all weather data
    weatherForecastVM.clearWeatherData()
    
    // Expected result
    XCTAssert(weatherForecastVM.weatherList.value.isEmpty)
    XCTAssertEqual(weatherForecastVM.cityName.value, "No location")
  }
}
