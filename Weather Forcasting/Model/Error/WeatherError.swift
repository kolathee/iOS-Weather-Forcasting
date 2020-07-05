//
//  WeatherError.swift
//
//  Created by Kolathee Payuhawattana on 30/6/2563 BE
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class WeatherError: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let cod = "cod"
    static let message = "message"
  }

  // MARK: Properties
  public var cod: String?
  public var message: String?

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
    cod <- map[SerializationKeys.cod]
    message <- map[SerializationKeys.message]
  }
}
