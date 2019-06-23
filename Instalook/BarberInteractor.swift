
//
//  BarberInteractor.swift
//  Instalook
//
//  Created by Amer Shaker on 6/4/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class BarberInteractor {
    
    func addBarber(salonId: Int,
                   barber: Barber,
                   completionHandler: @escaping (Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.addBarber(salonId: salonId, barber: barber)).responseJSON {
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
    
    func getAllBarbers(salonId: Int,
                       completionHandler: @escaping ([Barber]?, Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.getAllBarbers(salonId: salonId)).responseArray {
            (response: DataResponse<[Barber]>) in
            let result = response.result
            switch result {
            case .success(let barbers):
                completionHandler(barbers, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func deleteBarberById(barberId: Int,
                          completionHandler: @escaping (Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.deleteBarber(barberId: barberId)).responseJSON {
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
