//
//  CustomButton.swift
//  Weather Forcasting
//
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE
//  Copyright (c) . All rights reserved.
//
//

import UIKit

@IBDesignable final class CustomButton: UIButton {
  
  private var shadowLayer: CAShapeLayer!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setUpFont()
    setUpShadow()
  }
  
  private func setUpShadow() {
    self.layer.masksToBounds = false
    self.layer.cornerRadius = self.frame.height/2
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,
                                         cornerRadius: self.layer.cornerRadius).cgPath
    self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
    self.layer.shadowOpacity = 0.25
    self.layer.shadowRadius = 2.8
  }
  
  private func setUpFont() {
    self.titleLabel?.font = UIFont(name: "System", size: 22.0)
    self.titleLabel?.textColor = UIColor.black
  }
  
  @IBInspectable var fontSize: CGFloat = 22.0 {
    didSet {
      self.titleLabel?.font = UIFont(name: "System", size: fontSize)
    }
  }
}

