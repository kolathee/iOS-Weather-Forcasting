//
//  Clouds.swift
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Clouds: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let all = "all"
  }

  // MARK: Properties
  public var all: Int?

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
    all <- map[SerializationKeys.all]
  }
}
