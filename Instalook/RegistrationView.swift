//
//  RegistrationView.swift
//  Instalook
//
//  Created by jets on 6/14/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

protocol RegistrationView: class {
    func showIndicator()
    func hideIndicator()
    func registrationSuccess()
    func showError(error: String)
}
