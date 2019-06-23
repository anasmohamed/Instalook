//
//  ServiceInteractor.swift
//  Instalook
//
//  Created by Amer Shaker on 6/4/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class ServiceInteractor {
    
    func addService(salonId: Int,
                    service: Service,
                    completionHandler: @escaping (Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.addService(salonId: salonId, service: service)).responseJSON {
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
    
    func getAllServices(salonId: Int,
                        completionHandler: @escaping ([Service]?, Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.getAllServices(salonId: salonId)).responseArray {
            (response: DataResponse<[Service]>) in
            let result = response.result
            switch result {
            case .success(let services):
                completionHandler(services, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func deleteServiceById(serviceId: Int,
                           completionHandler: @escaping (Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.deleteService(serviceId: serviceId)).responseJSON {
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
