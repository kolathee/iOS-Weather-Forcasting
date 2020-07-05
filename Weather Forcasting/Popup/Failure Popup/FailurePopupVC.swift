//
//  FailurePopupVC.swift
//  Weather Forcasting
//
//  Created by Kolathee Payuhawattana on 22/6/2563 BE.
//  Copyright © 2563 Cup. All rights reserved.
//

import UIKit

class FailurePopupVC: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel!
  @IBOutlet weak var doneBT: CustomButton!
  
  let vm = FailurePopupVM()
  
  // MARK: - Application Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpVM()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    vm.updateUI()
  }
  
  // MARK: - Setup
  
  func setUpVM() {
    vm.vc = self
    vm.titleLabel = titleLabel
    vm.bodyLabel = bodyLabel
    vm.doneBT = doneBT
  }
  
  @IBAction func didTapDoneBT(_ sender: Any) {
    vm.didTapDoneBT()
  }
}
