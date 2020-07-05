//
//  NavigationHelper.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit

enum AppPages {
  case currentWeather
  case weatherForecast
}

class NavigationHelper: NSObject {
  
  private static var nextPageBackButton: UIBarButtonItem {
    let button = UIBarButtonItem(title: "",
                                 style: .plain,
                                 target: nil,
                                 action: nil)
    button.tintColor = UIColor.black
    return button
  }
  
  // MARK: - Main flow
  
  static var currentWeatherVC: CurrentWeatherVC {
    return loadController(storyboard: "Main",
                          ofType: CurrentWeatherVC.self)
  }
  
  static var weatherForecastVC: WeatherForecastVC {
    return loadController(storyboard: "Main",
                          ofType: WeatherForecastVC.self)
  }
  
  // MARK: - Popup
  
  static var failurePopupVC: FailurePopupVC {
    return loadController(storyboard: "Popup",
                          ofType: FailurePopupVC.self)
  }
}
