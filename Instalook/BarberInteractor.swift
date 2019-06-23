
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
            
            
            if let request = response.request {
                print("Request Request: \(request)")
                print("Request Description: \(request.description)")
                print("Request Debug Description: \(request.debugDescription)")
                print("Response Request HTTP method: \(request.httpMethod!)")
                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
            } else {
                print("Response Request: nil")
            }
            
            if let responseStatusCode = response.response {
                print("Response Status Code: \(responseStatusCode.statusCode)")
            } else {
                print("Response Status Code: nil")
            }
            
            if let error = response.error {
                print("Response Error Code: \(error.localizedDescription)")
            } else {
                print("Response Error Code: nil")
            }
            
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
