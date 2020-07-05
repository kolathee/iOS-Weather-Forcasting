//
//  Weather.swift
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Weather: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let main = "main"
    static let icon = "icon"
    static let descriptionValue = "description"
    static let id = "id"
  }

  // MARK: Properties
  public var main: String?
  public var icon: String?
  public var descriptionValue: String?
  public var id: Int?

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
    main <- map[SerializationKeys.main]
    icon <- map[SerializationKeys.icon]
    descriptionValue <- map[SerializationKeys.descriptionValue]
    id <- map[SerializationKeys.id]
  }
}
