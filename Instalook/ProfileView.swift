//
//  SalonProfileView.swift
//  Instalook
//
//  Created by Amer Shaker on 6/16/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

protocol ProfileView: class {
    func showIndicator()
    func hideIndicator()
    func setSalonName(salonName: String)
    func setSalonEmail(salonEmail: String)
    func setSalonType(salonType: String)
    func showError(error: String)
}
