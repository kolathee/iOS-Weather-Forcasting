//
//  WeatherForecastTVC.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit

class WeatherForecastTVC: UITableViewCell {
  @IBOutlet weak var date: UILabel!
  @IBOutlet weak var weatherImageView: UIImageView!
  @IBOutlet weak var temp: UILabel!
  
  let converter = Converter()
  
  // MARK: - Setup
  
  func setUpUI(weatherInfo: List,
               tempUnit: TempUnit) {
    
    if let imageName = weatherInfo.weather?.first?.main,
      let image = UIImage(named: imageName + "PNG") {
      self.weatherImageView.image = image
    }
    
    if let kelvin = weatherInfo.main?.temp {
      let tempInCurrentUnit = converter.convert(kelvin: kelvin, to: tempUnit)
      self.temp.text = String(describing: tempInCurrentUnit.roundToPlaces(0)) + tempUnit.rawValue
    }
    
    if let date = weatherInfo.dtTxt {
      self.date.text = String(describing: date)
    }
  }
}
