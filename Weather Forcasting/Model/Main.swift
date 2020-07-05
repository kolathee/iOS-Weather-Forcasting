//
//  Main.swift
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Main: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let grndLevel = "grnd_level"
    static let tempMin = "temp_min"
    static let tempMax = "temp_max"
    static let temp = "temp"
    static let seaLevel = "sea_level"
    static let pressure = "pressure"
    static let humidity = "humidity"
    static let tempKf = "temp_kf"
    static let feelsLike = "feels_like"
  }

  // MARK: Properties
  public var grndLevel: Int?
  public var tempMin: Float?
  public var tempMax: Float?
  public var temp: Float?
  public var seaLevel: Int?
  public var pressure: Int?
  public var humidity: Int?
  public var tempKf: Float?
  public var feelsLike: Float?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    grndLevel <- map[SerializationKeys.grndLevel]
    tempMin <- map[SerializationKeys.tempMin]
    tempMax <- map[SerializationKeys.tempMax]
    temp <- map[SerializationKeys.temp]
    seaLevel <- map[SerializationKeys.seaLevel]
    pressure <- map[SerializationKeys.pressure]
    humidity <- map[SerializationKeys.humidity]
    tempKf <- map[SerializationKeys.tempKf]
    feelsLike <- map[SerializationKeys.feelsLike]
  }
}
