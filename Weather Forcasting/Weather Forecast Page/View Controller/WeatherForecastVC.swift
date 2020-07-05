//
//  WeatherForecastVC.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit
import SwiftGifOrigin
import RxSwift
import RxCocoa

class WeatherForecastVC: UIViewController {
  @IBOutlet weak var forecastTV: UITableView!
  
  let forecastVM = WeatherForecastVM()
  let disposedBag = DisposeBag()
  
  // MARK: - View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpUIBinding()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    forecastVM.fetchForecastInfomation()
  }
  
  // MARK: - Setup binding

  func setUpUIBinding() {
    // Navigation
    forecastVM.cityName
      .asObservable()
      .subscribe(onNext: { [unowned self] (name) in
        self.title = name + " in 5 days"
      })
      .disposed(by: disposedBag)
    
    // Table view
    forecastVM.weatherList
      .asObservable()
      .bind(to: forecastTV.rx.items(cellIdentifier: "WeatherForecastTVC",
                                    cellType: WeatherForecastTVC.self)) {
        [unowned self] (row, model, cell) in
        cell.setUpUI(weatherInfo: model, tempUnit: self.forecastVM.currentUnit.value)
      }
      .disposed(by: disposedBag)
    
    // Fetching data error
    forecastVM.errorMessage
      .asObservable()
      .subscribe(onNext: {
        [unowned self] (message) in
        if message.isNotEmpty {
          self.forecastVM.clearWeatherData()
          PopupManager.shared.showFailurePopup(headerTitle: "Please try again",
                                               body: message,
                                               onCompletion: {
            [unowned self] in
            self.navigateBack()
          })
        }
      })
      .disposed(by: disposedBag)
  }
}
