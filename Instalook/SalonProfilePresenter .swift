//
//  SalonProfileVCPresenter .swift
//  Instalook
//
//  Created by Amer Shaker on 6/17/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

class SalonProfilePresenter {
    
    private weak var view: SalonProfileView?
    private let salonProfileInteractor: SalonProfileInteractor
    private var salon: Salon?
    
    init(view: SalonProfileView) {
        self.view = view
        salonProfileInteractor = SalonProfileInteractor()
    }
    
    func getSalonById(salonId: Int) {
        
        if salonId != 0 {
            
            view?.showIndicator()
            salonProfileInteractor.getSalonById(salonId: salonId) { [unowned self] (salon, error) in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    guard let salon = salon else { return }
                    self.salon = salon
                
                    guard let salonName = salon.salonName else { return }
                    self.view?.setSalonName(salonName: salonName)
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
}
