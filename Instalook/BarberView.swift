//
//  BarberView.swift
//  Instalook
//
//  Created by Amer Shaker on 6/16/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

protocol BarberView: class {
    func showIndicator()
    func hideIndicator()
    func addBarberSuccess()
    func getAllBarbersSuccess()
    func deleteBarberSuccess(indexPath: IndexPath)
    func showError(error: String)
}
