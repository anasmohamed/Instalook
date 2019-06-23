//
//  LoginPresenter.swift
//  Instalook
//
//  Created by Amer Shaker on 6/14/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    private weak var view: LoginView?
    private let salonInteractor: SalonInteractor
    private var salon: Salon?
    
    init(view: LoginView) {
        self.view = view
        salonInteractor = SalonInteractor()
    }
    
    func login(email: String, password: String) {
        
        if isValidEmail(email: email),
            isValidPassword(password: password) {
            
            view?.showIndicator()
            salonInteractor.login(email: email, password: password) { [unowned self] (salon, error) in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    guard let salon = salon else { return }
                    self.salon = salon
                    self.view?.loginSuccess()
                    
                    guard let salonId = salon.salonId else { return }
                    self.saveSalonIdIntoUserDefaults(salonId: salonId)
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
    
    private func isValidEmail(email: String) -> Bool {
        return !(email.isEmpty)
    }
    
    private func isValidPassword(password: String) -> Bool {
        return !(password.isEmpty)
    }
    
    private func saveSalonIdIntoUserDefaults(salonId: Int) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(salonId, forKey: "salonId")
    }
}
