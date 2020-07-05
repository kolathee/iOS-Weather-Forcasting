//
//  PopupManager.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit
import AVFoundation

typealias CompletionHandler = () -> ()
typealias CancelHandler = () -> ()

final class PopupManager {
  static let shared = PopupManager()
  
  private init() {}
  
  func present(popup: UIViewController) {
    guard let topVC = NavigationHelper.getTopViewController() else { return }
    topVC.present(popup,
                  animated: true,
                  completion: nil)
  }
  
  // MARK: - Status popups

  func showFailurePopup(headerTitle: String = "",
                        body: String = "",
                        onCompletion completion: CompletionHandler? = nil) {
    
    let popup = NavigationHelper.failurePopupVC
    popup.vm.setUp(headerTitle: headerTitle,
                   body: body,
                   onCompletion: completion)
    setPresentingStyle(vc: popup)
    present(popup: popup)
  }
  
  func showErrorPopup(onCompletion completion: CompletionHandler? = nil) {
    showFailurePopup(body: "An error occurs", onCompletion: completion)
  }
  
  // MARK: - Configuration

  func setPresentingStyle(vc: UIViewController) {
    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .overFullScreen
  }
}
