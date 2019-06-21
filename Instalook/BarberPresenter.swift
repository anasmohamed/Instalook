//
//  Presenter.swift
//  Instalook
//
//  Created by Amer Shaker on 6/16/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

class BarberPresenter {
    
    private weak var view: BarberView?
    private let barberInteractor: BarberInteractor
    private var barber: Barber?
    private var barbers: [Barber]
    
    init(view: BarberView) {
        self.view = view
        barberInteractor = BarberInteractor()
        barbers = [Barber]()
    }
    
    func viewDidLoad() {
        getAllBarbers(salonId: 202)
    }
    
    func addBarber(salonId: Int, barber: Barber) {
        
        if salonId != 0 {
            
            view?.showIndicator()
            barberInteractor.addBarber(salonId: salonId, barber: barber) { [unowned self] error in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    self.view?.addBarberSuccess()
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
    
    func getAllBarbers(salonId: Int) {
        
        if salonId != 0 {
            
            view?.showIndicator()
            barberInteractor.getAllBarbers(salonId: salonId) { [unowned self] (barbers, error) in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    guard let barbers = barbers else { return }
                    self.barbers = barbers
                    self.view?.getAllBarbersSuccess()
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
    
    func getBarbersCount() -> Int {
        return barbers.count
    }
    
    func configure(cell: BarberCellView, for index: Int) {
        let barber = barbers[index]
        guard let firstName = barber.firstName,
            let lastName = barber.lastName else { return }
        cell.displayBarberName(barberName: firstName + lastName)
    }
    
}
