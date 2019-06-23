//
//  BarberDetailView.swift
//  Instalook
//
//  Created by Amer Shaker on 6/24/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

protocol BarberDetailView: class {
    func showIndicator()
    func hideIndicator()
    func resetForm()
    func addBarberSuccess()
    func updateBarberSuccess()
    func showError(error: String)
}
