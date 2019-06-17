//
//  BarberViewController+PresenterDelegate.swift
//  Instalook
//
//  Created by jets on 10/14/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import UIKit

extension BarberViewController: BarberView {
    
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    func addBarberSuccess() {
        //        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        //        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        //        self.present(homeViewController, animated: true, completion: nil)
    }
    
    func getAllBarbersSuccess() {
        tableView.reloadData()
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
