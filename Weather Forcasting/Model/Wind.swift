//
//  Wind.swift
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Wind: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let gust = "gust"
    static let speed = "speed"
    static let deg = "deg"
  }

  // MARK: Properties
  public var gust: Float?
  public var speed: Float?
  public var deg: Int?

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
    gust <- map[SerializationKeys.gust]
    speed <- map[SerializationKeys.speed]
    deg <- map[SerializationKeys.deg]
  }
}
