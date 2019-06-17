
//
//  BarberInteractor.swift
//  Instalook
//
//  Created by jets on 10/14/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class BarberInteractor {
    
//    func addService(salonId: Int,
//                    service: Service,
//                    completionHandler: @escaping (Error?) -> Void) {
//        
//        Alamofire.request(InstalookRouter.addService(salonId: salonId, service: service)).responseJSON {
//            (response: DataResponse<Any>) in
//            let result = response.result
//            switch result {
//            case .success:
//                completionHandler(nil)
//            case .failure(let error):
//                completionHandler(error)
//            }
//        }
//    }
    
    func getAllBarbers(salonId: Int,
                        completionHandler: @escaping ([Barber]?, Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.getAllServices(salonId: salonId)).responseArray {
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
}

