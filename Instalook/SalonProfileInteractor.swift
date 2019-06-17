//
//  SalonProfileInteractor.swift
//  Instalook
//
//  Created by Amer Shaker on 6/16/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class SalonProfileInteractor {
    
    func getSalonById(salonId: Int,
                      completionHandler: @escaping (Salon?, Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.getSalonById(salonId: salonId)).responseObject {
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
}
