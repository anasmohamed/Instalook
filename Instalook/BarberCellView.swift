//
//  BarberCellView.swift
//  Instalook
//
//  Created by Amer Shaker on 6/18/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

protocol BarberCellView: class {
    func displayBarberName(barberName: String)
    func displayBarberRole(barberRole: String)
    func displayBarberRating(barberRating: Double)
}
