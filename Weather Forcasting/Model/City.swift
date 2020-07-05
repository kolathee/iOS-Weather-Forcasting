//
//  City.swift
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class City: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let sunset = "sunset"
    static let sunrise = "sunrise"
    static let name = "name"
    static let id = "id"
    static let timezone = "timezone"
    static let coord = "coord"
    static let population = "population"
    static let country = "country"
  }

  // MARK: Properties
  public var sunset: Int?
  public var sunrise: Int?
  public var name: String?
  public var id: Int?
  public var timezone: Int?
  public var coord: Coord?
  public var population: Int?
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
    name <- map[SerializationKeys.name]
    id <- map[SerializationKeys.id]
    timezone <- map[SerializationKeys.timezone]
    coord <- map[SerializationKeys.coord]
    population <- map[SerializationKeys.population]
    country <- map[SerializationKeys.country]
  }
}
