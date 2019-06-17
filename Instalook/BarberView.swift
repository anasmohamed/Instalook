//
//  BarberView.swift
//  Instalook
//
//  Created by jets on 10/14/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation

protocol BarberView: class {
    func showIndicator()
    func hideIndicator()
    func addBarberSuccess()
    func getAllBarbersSuccess()
    func showError(error: String)
}
