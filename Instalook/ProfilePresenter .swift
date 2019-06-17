//
//  SalonProfileVCPresenter .swift
//  Instalook
//
//  Created by Amer Shaker on 6/17/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

class ProfilePresenter {
    
    private weak var view: ProfileView?
    private let profileInteractor: ProfileInteractor
    private var salon: Salon?
    
    init(view: ProfileView) {
        self.view = view
        profileInteractor = ProfileInteractor()
    }
    
    func getSalonById(salonId: Int) {
        
        if salonId != 0 {
            
            view?.showIndicator()
            profileInteractor.getSalonById(salonId: salonId) { [unowned self] (salon, error) in
                
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
