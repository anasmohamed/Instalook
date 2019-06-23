//
//  ServiceDetailViewController.swift
//  Instalook
//
//  Created by jets on 6/24/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit

class ServiceDetailViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var serviceNameTextField: UITextField!
    @IBOutlet weak var serviceTypeTextField: UITextField!
    @IBOutlet weak var servicePriceTextField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: ServiceDetailPresenter!
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ServiceDetailPresenter(view: self)
    }
    
    // MARK: Action
    @IBAction func addService(_ sender: UIButton) {
        
        let salonId = UserDefaults.standard.integer(forKey: "salonId")
        
        guard let serviceName = serviceNameTextField.text,
            let serviceType = serviceTypeTextField.text,
            let servicePriceString = servicePriceTextField.text,
            let servicePrice = Double(servicePriceString) else { return }
        
        presenter.addService(salonId: salonId,
                             serviceName: serviceName,
                             serviceType: serviceType,
                             servicePrice: servicePrice)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
