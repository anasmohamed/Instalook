//
//  BarberDetailViewController+TextFieldDelegate.swift
//  Instalook
//
//  Created by jets on 6/24/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit

extension BarberDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
