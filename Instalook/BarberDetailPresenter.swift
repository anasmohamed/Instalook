//
//  BarberDetailPresenter.swift
//  Instalook
//
//  Created by Amer Shaker on 6/24/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

class BarberDetailPresenter {
    
    private weak var view: BarberDetailView?
    private let barberInteractor: BarberInteractor
    private var barber: Barber?
    
    init(view: BarberDetailView) {
        self.view = view
        barberInteractor = BarberInteractor()
    }
    
    func addBarber(salonId: Int,
                   firstName: String,
                   lastName: String,
                   barberRole: String) {
        
        if salonId != 0,
            !isEmpty(string: firstName),
            !isEmpty(string: lastName),
            !isEmpty(string: barberRole) {
            
            let barber = Barber()
            barber.firstName = firstName
            barber.lastName = lastName
            barber.role = barberRole
            barber.rate = 1
            barber.isAvailable = 1

            view?.showIndicator()
            barberInteractor.addBarber(salonId: salonId, barber: barber) { [unowned self] error in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    self.view?.addBarberSuccess()
                    self.view?.resetForm()
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
    
    // MARK: Validation methods
    private func isEmpty(string: String) -> Bool {
        return string.isEmpty
    }
}
