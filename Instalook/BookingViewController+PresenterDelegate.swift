//
//  BookingViewController+PresenterDelegate.swift
//  Instalook
//
//  Created by jets on 10/17/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import UIKit

extension BookingViewController: BookingView {
    
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
   
    func getBarberBookingsSuccess() {
        tableView.reloadData()
 
    }
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
