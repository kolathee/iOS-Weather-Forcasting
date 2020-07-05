//
//  APIService.swift
//  Weather Forcasting
//
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import KRProgressHUD

typealias OnCompletion = (Any) -> ()
typealias OnError = (String) -> ()
typealias Parameters = [String: Any]

final class APIService: NSObject {
  
  static func setGETParams(_ param: Parameters) -> String {
    var parameter = "?"
    for (key, value) in param {
      parameter += "\(key)=\(value)&"
    }
    parameter.removeLast()
    return parameter
  }
  
  static func setAPIkey(_ url: String) -> String {
    return url + "&appid=" + APIPath.apikey
  }
  
  static let session = Session()
  
  static func request(url: String,
                      method: HTTPMethod,
                      parameters: Parameters = [:],
                      encoding: ParameterEncoding,
                      headers: HTTPHeaders = [:] ,
                      onCompletion completion: @escaping OnCompletion) {
  
    var url = url
    var params = parameters
    var encode: ParameterEncoding = JSONEncoding.default
    
    switch method {
      case .get:
        url += setGETParams(parameters)
        params = [:]
        encode = URLEncoding.default
      case .post:
        break
      default:
        break
    }
    
    let urlWithAPIKey = setAPIkey(url)
    
    // MARK: - Alamofire request
    AF.request(urlWithAPIKey,
               method: method,
               parameters: params,
               encoding: encode,
               headers: headers)
      .responseJSON { response in
        KRProgressHUD.dismiss({
          
          // MARK: - Parsing error
          guard let data = response.data,
                let json = JSON(data).dictionaryObject else {
            PopupManager.shared.showFailurePopup(headerTitle: "Error",
                                                 body: "JSON error",
                                                 onCompletion: nil)
            return
          }
          
          switch response.result {
            case .success(_):
              completion(json)
            case .failure(_):
              // MARK: - Network error
              PopupManager.shared.showFailurePopup(headerTitle: "Error",
                                                   body: "Network error",
                                                   onCompletion: nil)
          }
        })
      }
  }
}
