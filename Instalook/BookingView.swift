//
//  BookingView.swift
//  Instalook
//
//  Created by jets on 10/17/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation

protocol BookingView: class {
    func showIndicator()
    func hideIndicator()
    func getBarberBookingsSuccess()
    func showError(error: String)
}
