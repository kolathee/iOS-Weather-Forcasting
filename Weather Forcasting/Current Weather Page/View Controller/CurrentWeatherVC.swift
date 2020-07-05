//
//  CurrentWeatherVC.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SwiftGifOrigin
import RxSwift
import RxCocoa

class CurrentWeatherVC: UIViewController {
  
  @IBOutlet weak var rightArrowButton: UIBarButtonItem!

  @IBOutlet weak var humidityLabel: UILabel!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var cityNameLabel: UILabel!
  @IBOutlet weak var weatherImageView: UIImageView!
  
  @IBOutlet weak var searchingTextField: UITextField!
  @IBOutlet weak var xButton: UIButton!
  @IBOutlet weak var switchingUnitButton: UIButton!
  
  private let disposedBag = DisposeBag()
  
  let currentWeatherVM = CurrentWeatherVM()
  
  private lazy var weatherForecastVC: WeatherForecastVC = {
    return NavigationHelper.weatherForecastVC
  }()
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpNavigation()
    setUpKeyboard()
    setUpUIBinding()
    setUpErrorBinding()
    setUpOtherPageBinding()
  }
  
  // MARK: - Setup
  
  func setUpNavigation() {
    let button = UIBarButtonItem(title: "",
                                 style: .plain,
                                 target: nil,
                                 action: nil)
    button.tintColor = UIColor.black
    navigationItem.backBarButtonItem = button
  }
  
  func setUpKeyboard() {
    searchingTextField.delegate = self
    searchingTextField.inputAccessoryView = UIView()
  }
  
  // MARK: - Setup blinding
  
  func setUpUIBinding() {
    // MARK: Weather Image
    currentWeatherVM.weatherImageName
      .skip(1)
      .asObservable()
      .subscribe(onNext: {
        [unowned self] (imgName) in
        self.weatherImageView.loadGif(asset: imgName)
      })
      .disposed(by: disposedBag)
    
    // --------------------------------------------------------
    
    // MARK: Button Interection
    currentWeatherVM.canTapRightArrowButton
      .asObservable()
      .bind(to: rightArrowButton.rx.isEnabled)
      .disposed(by: disposedBag)
    
    // MARK: Button Action
    rightArrowButton.rx.tap
      .subscribe(onNext: {
        [unowned self] in
        self.navigateToWeatherForecastPage()
      })
      .disposed(by: disposedBag)
    
    switchingUnitButton.rx.tap
      .subscribe(onNext: {
        [unowned self] in
        self.currentWeatherVM.switchUnit()
      })
      .disposed(by: disposedBag)
    
    currentWeatherVM.xButtonTapped
      .asObserver()
      .subscribe(onNext: {
        [unowned self] in
        self.clearWeatherInformtionUI()
      })
      .disposed(by: disposedBag)
    
    currentWeatherVM.xButtonTapped
      .asObserver()
      .subscribe(onNext: {
        [unowned self] in
        self.currentWeatherVM.cityName.accept("")
      })
      .disposed(by: disposedBag)
    
    xButton.rx.tap
      .subscribe(onNext: {
        [unowned self] in
        self.currentWeatherVM.xButtonTapped.onNext(Void())
      })
      .disposed(by: disposedBag)
    
    // --------------------------------------------------------
  
    // MARK: Text
    currentWeatherVM.temperature
      .skip(1)
      .map {
        let temp = String(describing: $0.roundToPlaces(0))
        let unit = self.currentWeatherVM.currentUnit.value.rawValue
        return temp + unit
      }
      .bind(to: temperatureLabel.rx.text)
      .disposed(by: disposedBag)
    
    currentWeatherVM.humidity
      .map { String(describing: $0) }
      .bind(to: humidityLabel.rx.text)
      .disposed(by: disposedBag)
    
    currentWeatherVM.currentUnit
      .asObservable()
      .subscribe(onNext: {
        [unowned self] (unit) in
        switch unit {
          case .celsius:
            self.switchingUnitButton.setTitle("use °F", for: .normal)
          case .fahrenheit:
            self.switchingUnitButton.setTitle("use °C", for: .normal)
        }
      })
      .disposed(by: disposedBag)
    
    // --------------------------------------------------------s

    // MARK: TextField
    searchingTextField.rx.text
      .orEmpty
      .bind(to: currentWeatherVM.cityName)
      .disposed(by: disposedBag)
    
    currentWeatherVM.cityName
      .asObservable()
      .bind(to: searchingTextField.rx.text)
      .disposed(by: disposedBag)
    
    currentWeatherVM.cityName
    .asObservable()
    .subscribe(onNext: {
      [unowned self] (text) in
      self.xButton.isEnabled = text.isNotEmpty
    })
    .disposed(by: disposedBag)
  }
  
  func setUpErrorBinding() {
    currentWeatherVM.errorMessage
      .skip(1)
      .asObservable()
      .subscribe(onNext: {
        [unowned self] (message) in
        self.clearWeatherInformtionUI()
        PopupManager.shared.showFailurePopup(headerTitle: "Please try again",
                                             body: message,
                                             onCompletion: nil)
      })
      .disposed(by: disposedBag)
  }
  
  func setUpOtherPageBinding() {
    currentWeatherVM.cityName
      .asObservable()
      .bind(to: weatherForecastVC.forecastVM.cityName)
      .disposed(by: disposedBag)
    
    currentWeatherVM.currentUnit
      .asObservable()
      .bind(to: weatherForecastVC.forecastVM.currentUnit)
      .disposed(by: disposedBag)
  }
  
  // MARK: - Behaviors
  
  func navigateToWeatherForecastPage() {
    navigationController?.pushViewController(weatherForecastVC, animated: true)
  }
  
  func clearWeatherInformtionUI() {
    cityNameLabel.text = "City not found"
    temperatureLabel.text = "Hello :)"
    humidityLabel.text = "-"
    weatherImageView.image = UIImage(named: "DefaultWeather")
  }
}

// MARK: - Text field delegate

extension CurrentWeatherVC: UITextFieldDelegate {
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    // Prevent empty space
    guard string != " " else { return false }
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    guard currentWeatherVM.cityName.value.isNotEmpty else { return true }
    self.cityNameLabel.text = currentWeatherVM.cityName.value
    currentWeatherVM.fetchCurrentWeather()
    return true
  }
}
