//
//  CustomView.swift
//  Weather Forcasting
//
//  Created by Eak_ on 17/10/2560 BE.
//  Copyright © 2560 Eak_. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setNeedsLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    setNeedsLayout()
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
  
  @IBInspectable var circleBorder: Bool {
    set {
      layer.cornerRadius = layer.frame.height / 2
      clipsToBounds = true
    }
    get {
      return layer.cornerRadius > 0 ? true : false
    }
  }
  
  @IBInspectable var bgColor: UIColor {
    set {
      layer.backgroundColor = newValue.cgColor
    }
    get {
      if let color = layer.backgroundColor {
        return UIColor(cgColor: color)
      } else {
        return UIColor.clear
      }
    }
  }
  
  @IBInspectable var shadowRadius: CGFloat {
    get {
      return layer.shadowRadius
    }
    set {
      layer.shadowRadius = newValue
    }
  }
  
  @IBInspectable var shadowOpacity: Float {
    get {
      return layer.shadowOpacity
    }
    set {
      layer.shadowOpacity = newValue
    }
  }
  
  @IBInspectable var shadowOffset: CGSize {
    get {
      return layer.shadowOffset
    }
    set {
      layer.shadowOffset = newValue
    }
  }
  
  @IBInspectable var shadowColor: UIColor? {
    get {
      if let color = layer.shadowColor {
        return UIColor(cgColor: color)
      }
      return nil
    }
    set {
      if let color = newValue {
        layer.shadowColor = color.cgColor
      } else {
        layer.shadowColor = nil
      }
    }
  }
  
  @IBInspectable var dropShadow: Bool {
    set {
      if newValue {
        layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = 1
        
      }
    }
    get {
      return layer.shadowOpacity > 0
    }
  }
}

extension UIView {
  
  func dropShadow(shadowOpacity :Float = 0.3) {
    layer.cornerRadius = 8.0
    layer.masksToBounds = false
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.shadowOpacity = shadowOpacity
    layer.shadowOffset = .zero
    layer.shadowRadius = 8
    layer.shouldRasterize = true
    layer.rasterizationScale = 1
    
  }
  
  // OUTPUT 1
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: -1, height: 1)
    layer.shadowRadius = 1
    
    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
  
  // OUTPUT 2
  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius
    
    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}

class CustomViewWithRoundedcornersAndShadow: UIView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.layer.masksToBounds = false
    self.layer.cornerRadius = self.frame.height/2
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
    self.layer.shadowOffset =  .zero
    self.layer.shadowOpacity = 0.3
    self.layer.shadowRadius = 6.0
  }
}
