//
//  ShadowView.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 5/5/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit

@IBDesignable class ShadowView: UIView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.clipsToBounds = true
    self.layer.masksToBounds = false
    self.layer.shadowColor = UIColor.darkGray.cgColor
    self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
    self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    self.layer.shadowOpacity = 0.25
    self.layer.shadowRadius = 2.0
  }
  
  /* BORDER */
  @IBInspectable var borderColor:UIColor? {
    set {
      layer.borderColor = newValue?.cgColor
    }
    get {
      if let color = layer.borderColor {
        return UIColor(cgColor: color)
      } else {
        return UIColor.clear
      }
    }
  }
  
  @IBInspectable var borderWidth:CGFloat {
    set {
      layer.borderWidth = newValue
    }
    get {
      return layer.borderWidth
    }
  }
  
  /* BORDER RADIUS */
  @IBInspectable var cornerRadius:CGFloat {
    set {
      layer.cornerRadius = newValue
      clipsToBounds = newValue > 0
    }
    get {
      return layer.cornerRadius
    }
  }
  
  @IBInspectable var shadowRadius: CGFloat = 2.0 {
    didSet {
      self.layer.shadowRadius = shadowRadius
    }
  }
  
  @IBInspectable var shadowOpacity: Float = 0.25 {
    didSet {
      self.layer.shadowOpacity = shadowOpacity
    }
  }
}
