//
//  BarberDetailViewController.swift
//  Instalook
//
//  Created by jets on 6/20/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit

class BarberDetailViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var roleTextField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: BarberDetailPresenter!
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = BarberDetailPresenter(view: self)
    }
    
    // MARK: Action
    @IBAction func addBarber(_ sender: UIButton) {
        
        let salonId = UserDefaults.standard.integer(forKey: "salonId")

        guard let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let barberRole = roleTextField.text else { return }
        
        presenter.addBarber(salonId: salonId,
                            firstName: firstName,
                            lastName: lastName,
                            barberRole: barberRole)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
