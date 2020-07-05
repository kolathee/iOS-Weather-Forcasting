//
//  NavigationHelper+Behaviors.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 8/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit

extension NavigationHelper {
  
  // MARK: - Loading
  
  static func loadController<T>(storyboard : String,
                                ofType type: T.Type = T.self) -> T where T: UIViewController {
    let storyBoard: UIStoryboard = UIStoryboard(name: storyboard, bundle: nil)
    guard let viewController = storyBoard.instantiateViewController(withIdentifier: type.reuseID) as? T else { fatalError() }
    return viewController
  }
  
  // MARK: - Switch Root View
  
  static func switchRootViewController(to page: AppPages,
                                       window: UIWindow! = UIWindow.key,
                                       animated: Bool = true,
                                       completion: @escaping (() -> ()) = {}) {
    var rootVC = UIViewController()
    
    switch page {
      case .currentWeather:
        rootVC = currentWeatherVC
      case .weatherForecast:
        rootVC = weatherForecastVC
    }
    
    if animated {
      UIView.transition(with: window,
                        duration: 0.5,
                        options: .transitionCrossDissolve,
                        animations: {
                          
        let oldState = UIView.areAnimationsEnabled
        UIView.setAnimationsEnabled(false)
        window.rootViewController = rootVC
        UIView.setAnimationsEnabled(oldState)
                          
      }, completion: { (finished: Bool) -> () in
        completion()
      })
    } else {
      window.rootViewController = rootVC
    }
  }
  
  // MARK: - Top View
  
  static func getTopViewController(base: UIViewController? = UIWindow.key?.rootViewController) -> UIViewController? {
    
    if let nav = base as? UINavigationController {
      return getTopViewController(base: nav.visibleViewController)
      
    } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
      return getTopViewController(base: selected)
      
    } else if let presented = base?.presentedViewController {
      return getTopViewController(base: presented)
    }
    return base
  }
}

