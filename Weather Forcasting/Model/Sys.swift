//
//  Sys.swift
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Sys: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let sunset = "sunset"
    static let sunrise = "sunrise"
    static let id = "id"
    static let type = "type"
    static let country = "country"
  }

  // MARK: Properties
  public var sunset: Int?
  public var sunrise: Int?
  public var id: Int?
  public var type: Int?
  public var country: String?

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
    sunset <- map[SerializationKeys.sunset]
    sunrise <- map[SerializationKeys.sunrise]
    id <- map[SerializationKeys.id]
    type <- map[SerializationKeys.type]
    country <- map[SerializationKeys.country]
  }
}
