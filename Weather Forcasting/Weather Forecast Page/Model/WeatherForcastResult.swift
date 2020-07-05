//
//  WeatherForcastResult.swift
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class WeatherForcastResult: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let list = "list"
    static let cod = "cod"
    static let cnt = "cnt"
    static let message = "message"
    static let city = "city"
  }

  // MARK: Properties
  public var list: [List]?
  public var cod: String?
  public var cnt: Int?
  public var message: Int?
  public var city: City?

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
    list <- map[SerializationKeys.list]
    cod <- map[SerializationKeys.cod]
    cnt <- map[SerializationKeys.cnt]
    message <- map[SerializationKeys.message]
    city <- map[SerializationKeys.city]
  }
}
