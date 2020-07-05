//
//  APIPath.swift
//  Weather Forcasting
//
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//
//

import Foundation

class APIPath {
  
  // MARK: - Base
  
  static let DOMAIN = "https://api.openweathermap.org/data"
  static let apikey = "bd341cc07076d0ea772b799ac1213670"
  static let VERSION = "/2.5"
  
  static let BASE_API = DOMAIN + VERSION
  
  // MARK: - Weather Service
  
  static let CURRENT_WEATHER = BASE_API + "/weather"
  static let WEATHER_FORCAST = BASE_API + "/forecast"
}
