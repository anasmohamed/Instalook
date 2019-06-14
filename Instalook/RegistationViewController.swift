//
//  RegistationViewController.swift
//  Instalook
//
//  Created by Amer Shaker on 6/14/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation
import UIKit

class RegistationViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: RegistrationPresenter!
    
    
    // MARK: View life cycle
    override func viewDidLoad() {
        presenter = RegistrationPresenter(view: self)
    }
    
    // MARK: Actions
    @IBAction func register(_ sender: UIButton) {
        
        guard let name = nameTextField.text,
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let confirmPassword = confirmPasswordTextField.text else { return }
        
        presenter.register(name: name,
                           email: email,
                           password: password,
                           confirmPassword: confirmPassword)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func dismissViewController(_ sender: UISwipeGestureRecognizer) {
        sender.direction = UISwipeGestureRecognizerDirection.left
        dismiss(animated: true, completion: nil)
    }
}
