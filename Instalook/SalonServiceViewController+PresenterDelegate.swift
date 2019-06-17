//
//  SalonServiceViewController+PresenterDelegate.swift
//  Instalook
//
//  Created by Amer Shaker on 6/16/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit

extension SalonServiceViewController: ServiceView {
    
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }

    func addServiceSuccess() {
        //        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        //        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        //        self.present(homeViewController, animated: true, completion: nil)
    }
    
    func getAllServicesSuccess() {
        
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
