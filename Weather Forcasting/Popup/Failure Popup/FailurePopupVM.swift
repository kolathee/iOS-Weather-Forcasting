//
//  v.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit

class FailurePopupVM {

  weak var vc: FailurePopupVC!
  
  weak var titleLabel: UILabel!
  weak var bodyLabel: UILabel!
  weak var doneBT: CustomButton!
  
  var onCompletion: CompletionHandler?
  
  // MARK: - Stages
  
  var titleMessage = ""
  var bodyMessage = ""
  
  // MARK: - setup
  
  func setUp(headerTitle: String = "",
             body: String = "",
             onCompletion: CompletionHandler? = nil) {
    
    self.onCompletion = onCompletion
    self.titleMessage = headerTitle
    self.bodyMessage = body
  }
  
  // MARK: - Behaviors
  
  func updateUI() {
    titleLabel.text = titleMessage
    bodyLabel.text = bodyMessage
  }
  
  // MARK: - Actions
  
  func didTapDoneBT() {
    vc.dismiss(animated: true, completion: {
      self.onCompletion?()
    })
  }
}
