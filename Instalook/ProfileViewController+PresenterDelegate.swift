//
//  SalonProfilePresenter+.swift
//  Instalook
//
//  Created by Amer Shaker on 6/17/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit

extension ProfileViewController: ProfileView {
    
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    func setSalonName(salonName: String) {
        salonNameLabel.text = salonName
    }

    func setSalonEmail(salonEmail: String) {

    }
    
    func setSalonType(salonType: String) {
        salonTypeLabel.text = salonType
    }

    func setSalonRate(salonRate: Double) {
        salonRatingView.rating = salonRate
    }
    
    func signOutSuccess() {
        let storyboard = UIStoryboard(name: "Authentication", bundle: Bundle.main)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        present(loginViewController, animated: true, completion: nil)
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
