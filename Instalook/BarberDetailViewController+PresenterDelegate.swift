//
//  BarberDetailViewController+PresenterDelegate.swift
//  Instalook
//
//  Created by Amer Shaker on 6/24/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit
import SVProgressHUD

extension BarberDetailViewController: BarberDetailView {
    
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    func resetForm() {
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        roleTextField.text = ""
    }
    
    func addBarberSuccess() {
        SVProgressHUD.showSuccess(withStatus: "Barber has been added successfully.")
    }
    
    func updateBarberSuccess() {
        
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
