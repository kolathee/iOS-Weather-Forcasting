//
//  List.swift
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class List: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let main = "main"
    static let clouds = "clouds"
    static let weather = "weather"
    static let dtTxt = "dt_txt"
    static let dt = "dt"
    static let sys = "sys"
    static let rain = "rain"
    static let wind = "wind"
  }

  // MARK: Properties
  public var main: Main?
  public var clouds: Clouds?
  public var weather: [Weather]?
  public var dtTxt: String?
  public var dt: Int?
  public var sys: Sys?
  public var rain: Rain?
  public var wind: Wind?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  required convenience public init?(map: Map){
    self.init()
  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    main <- map[SerializationKeys.main]
    clouds <- map[SerializationKeys.clouds]
    weather <- map[SerializationKeys.weather]
    dtTxt <- map[SerializationKeys.dtTxt]
    dt <- map[SerializationKeys.dt]
    sys <- map[SerializationKeys.sys]
    rain <- map[SerializationKeys.rain]
    wind <- map[SerializationKeys.wind]
  }
}
