//
//  UserInteractor.swift
//  Instalook
//
//  Created by Amer Shaker on 6/14/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class SalonInteractor {
    
    func login(email: String,
               password: String,
               completionHandler: @escaping (Salon?, Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.login(email: email, password: password)).responseObject {
            (response: DataResponse<Salon>) in
            let result = response.result
            switch result {
            case .success(let salon):
                completionHandler(salon, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func register(salon: Salon,
                  completionHandler: @escaping (Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.register(salon: salon)).responseJSON {
            (response: DataResponse<Any>) in
            let result = response.result
            switch result {
            case .success:
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error)
            }
        }
    }
}
