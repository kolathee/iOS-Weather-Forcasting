//
//  WeatherService.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

// MARK: - Request Input

struct CurrentWeatherRequestInput {
  var city = ""
}

struct WeatherForecastRequestInput {
  var city = ""
}

// MARK: - Requesting

extension APIService {
  
  public static func getErrorMessage(errorObject: Any) -> String {
    guard let result = Mapper<WeatherError>().map(JSONObject: errorObject),
          let message = result.message else {
      return "Unknown error"
    }
    return message
  }
  
  public static func fetchCurrentWeather(requestInput: CurrentWeatherRequestInput,
                                         success: @escaping (CurrentWeatherResult) -> (),
                                         errorHandling: @escaping (String)->()) {
    
    let url: String = APIPath.CURRENT_WEATHER
    let parameters: Parameters = ["q": requestInput.city]
    
    APIService.request(url: url,
                       method: .get,
                       parameters: parameters,
                       encoding: JSONEncoding.default,
                       onCompletion: { (responseJSON) in
       
      guard let currentWeather = Mapper<CurrentWeatherResult>().map(JSONObject: responseJSON),
            currentWeather.main != nil else {
        let message = getErrorMessage(errorObject: responseJSON)
        errorHandling(message)
        return
      }
                        
      success(currentWeather)
    })
  }
  
  public static func fetchWeatherForcast(requestInput: WeatherForecastRequestInput,
                                         success: @escaping (WeatherForcastResult) -> (),
                                         errorHandling: @escaping (String)->()) {
    
    let url: String = APIPath.WEATHER_FORCAST
    let parameters: Parameters = ["q": requestInput.city]
    
    APIService.request(url: url,
                       method: .get,
                       parameters: parameters,
                       encoding: JSONEncoding.default,
                       onCompletion: { (responseJSON) in
                        
      guard let weatherForecast = Mapper<WeatherForcastResult>().map(JSONObject: responseJSON),
            weatherForecast.list != nil else {
        let message = getErrorMessage(errorObject: responseJSON)
        errorHandling(message)
        return
      }
                        
      success(weatherForecast)
    })
  }
}
