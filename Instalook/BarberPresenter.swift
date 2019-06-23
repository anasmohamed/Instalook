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
        let salonId = UserDefaults.standard.integer(forKey: "salonId")
        getAllBarbers(salonId: salonId)
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
    
    func deleteBarber(indexPath: IndexPath) {
        
        let row = indexPath.row
        
        if let barberId = barbers[row].barberId {
            
            view?.showIndicator()
            barberInteractor.deleteBarberById(barberId: barberId) { [unowned self] (error) in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    let barber = self.barbers[row]
                    self.removeBarber(barber: barber)
                    self.view?.deleteBarberSuccess(indexPath: indexPath)
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }

    func getBarbersCount() -> Int {
        return barbers.count
    }
    
    func getBarberName(index: Int) -> String {
        if let firstName = barbers[index].firstName,
            let lastName = barbers[index].lastName {
            return firstName + lastName
        } else {
            return ""
        }
    }
    
    func removeBarber(barber: Barber) {
        if let index = barbers.index(of: barber) {
            barbers.remove(at: index)
        }
    }
    
    func configure(cell: BarberCellView, for index: Int) {
        let barber = barbers[index]
        guard let firstName = barber.firstName,
            let lastName = barber.lastName,
            let barberRole = barber.role,
            let barberRate = barber.rate else { return }
        
        cell.displayBarberName(barberName: firstName + " " + lastName)
        cell.displayBarberRole(barberRole: barberRole)
        cell.displayBarberRating(barberRating: barberRate)
    }
    
}
