//
//  LoginView.swift
//  Instalook
//
//  Created by Amer Shaker on 6/14/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

protocol LoginView: class {
    func showIndicator()
    func hideIndicator()
    func loginSuccess()
    func showError(error: String)
}
