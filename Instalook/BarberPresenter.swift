//
//  Presenter.swift
//  Instalook
//
//  Created by jets on 10/14/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
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
    
   func viewDidLoad()
    {
        getAllBarbers(salonId: 172)
    }
//    func addService(salonId: Int, service: Service) {
//        
//        if salonId != 0 {
//            
//            view?.showIndicator()
//            serviceInteractor.addService(salonId: salonId, service: service) { [unowned self] error in
//                
//                self.view?.hideIndicator()
//                if let error = error {
//                    self.view?.showError(error: error.localizedDescription)
//                } else {
//                    self.view?.addServiceSuccess()
//                }
//            }
//        } else {
//            view?.showError(error: "Invalid Credentials")
//        }
//    }
    
    func getBarbersCount() -> Int {
        return barbers.count
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
    func configur(cell: BarberCellView, for index: Int)
    {
       let barber = barbers[index]
        guard let baberName = barber.firstName else {
            return
        }
        cell.displayBaberName(barberName : baberName)
    }
}
