//
//  CurrentWeatherResult.swift
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class CurrentWeatherResult: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let main = "main"
    static let name = "name"
    static let coord = "coord"
    static let weather = "weather"
    static let dt = "dt"
    static let rain = "rain"
    static let id = "id"
    static let clouds = "clouds"
    static let timezone = "timezone"
    static let base = "base"
    static let sys = "sys"
    static let cod = "cod"
    static let wind = "wind"
  }

  // MARK: Properties
  public var main: Main?
  public var name: String?
  public var coord: Coord?
  public var weather: [Weather]?
  public var dt: Int?
  public var rain: Rain?
  public var id: Int?
  public var clouds: Clouds?
  public var timezone: Int?
  public var base: String?
  public var sys: Sys?
  public var cod: Int?
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
    name <- map[SerializationKeys.name]
    coord <- map[SerializationKeys.coord]
    weather <- map[SerializationKeys.weather]
    dt <- map[SerializationKeys.dt]
    rain <- map[SerializationKeys.rain]
    id <- map[SerializationKeys.id]
    clouds <- map[SerializationKeys.clouds]
    timezone <- map[SerializationKeys.timezone]
    base <- map[SerializationKeys.base]
    sys <- map[SerializationKeys.sys]
    cod <- map[SerializationKeys.cod]
    wind <- map[SerializationKeys.wind]
  }
}
