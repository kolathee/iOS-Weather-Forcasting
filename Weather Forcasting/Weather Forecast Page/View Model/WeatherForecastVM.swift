//
//  WeatherForecastVM.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import KRProgressHUD

class WeatherForecastVM {
  private let disposable = DisposeBag()
  
  // MARK: - Stages
  
  public let errorMessage = BehaviorRelay<String>(value: "")
  
  public let currentUnit = BehaviorRelay<TempUnit>(value: .celsius)
  public let cityName = BehaviorRelay<String>(value: "")
  public let weatherList = BehaviorRelay<[List]>(value: [])
  
  // MARK: - Behaviors
  
  func fetchForecastInfomation() {
    let input = WeatherForecastRequestInput(city: cityName.value)
    
    KRProgressHUD.show()
    APIService.fetchWeatherForcast(requestInput: input,
                                   success: {
      [unowned self] (weatherForcast) in
      guard let weatherList = weatherForcast.list else { return }
      self.weatherList.accept(weatherList)
                                    
    }, errorHandling: {
      [unowned self] (errorMessage) in
      self.errorMessage.accept(errorMessage)
    })
  }
  
  func clearWeatherData() {
    weatherList.accept([])
    cityName.accept("No location")
  }
}
