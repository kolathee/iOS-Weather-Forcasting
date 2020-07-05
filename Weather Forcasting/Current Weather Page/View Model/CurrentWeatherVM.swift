//
//  CurrentWeatherVM.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import KRProgressHUD

enum TempUnit: String {
  case celsius = "°C"
  case fahrenheit = "°F"
}

class CurrentWeatherVM: NSObject {
  let converter = Converter()
  private let disposable = DisposeBag()
  
  // MARK: - Stages
  
  // Errors
  public let errorMessage = BehaviorRelay<String>(value: "")
  
  // Actions
  public let xButtonTapped = PublishSubject<Void>()

  // Properties
  public let weatherImageName = BehaviorRelay<String>(value: "")
  public let humidity = BehaviorRelay<Int>(value: 0)
  public let cityName = BehaviorRelay<String>(value: "")
  
  /// Use celsius as a default unit
  public let currentUnit = BehaviorRelay<TempUnit>(value: .celsius)
  public let temperature = BehaviorRelay<Float>(value: 0.0)
  
  var isCityNameValid: Observable<Bool> {
    return cityName.map { value -> Bool in
      // Must have a value
      return !(value.isEmpty)
    }
  }
  
  var canTapRightArrowButton: Observable<Bool> {
    return isCityNameValid
  }
  
  // MARK: - Behaviors
  
  func fetchCurrentWeather() {
    let requestInput = CurrentWeatherRequestInput(city: self.cityName.value)
    
    KRProgressHUD.show()
    APIService.fetchCurrentWeather(requestInput: requestInput,
                                   success: {
      [unowned self] (weatherResult) in
      self.humidity.accept(weatherResult.main?.humidity ?? 0)
      let convertedTemp = self.converter.convert(kelvin: weatherResult.main?.temp ?? 0.0,
                                                 to: self.currentUnit.value)
      self.temperature.accept(convertedTemp)
                                    
      guard let imageName = weatherResult.weather?[0].main else { return }
      self.weatherImageName.accept(imageName)
                                    
    }, errorHandling: {
      [unowned self] (errorMessage) in
      self.errorMessage.accept(errorMessage)
    })
  }
  
  func switchUnit() {
    switch currentUnit.value {
      case .celsius:
        let temp = converter.convertToFahrenheit(celsius: temperature.value)
        currentUnit.accept(.fahrenheit)
        temperature.accept(temp)
      case .fahrenheit:
        let temp = converter.convertToCelsius(fahrenheit: temperature.value)
        currentUnit.accept(.celsius)
        temperature.accept(temp)
    }
  }
}
