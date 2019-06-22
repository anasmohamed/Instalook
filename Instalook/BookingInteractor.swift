//
//  BookingInteractor.swift
//  Instalook
//
//  Created by jets on 10/17/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class BookingInteractor {
    
   
    func getBarberBookings(barberId: Int,
                       completionHandler: @escaping ([Booking]?, Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.getBookings(barberId: barberId)).responseArray{
            (response: DataResponse<[Booking]>) in
            if let response = response.data {
                print("Response Data: \(response)")
            } else {
                print("Response Data: nil")
            }
            
            if let request = response.request {
                print("Request Request: \(request)")
                print("Request Description: \(request.description)")
                print("Request Debug Description: \(request.debugDescription)")
                print("Response Request HTTP method: \(request.httpMethod!)")
//                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
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
            case .success(let bookings):
                print(bookings)
                
                completionHandler(bookings, nil)
            case .failure(let error):
                completionHandler(nil, error)
                print(error)
            }
        }
    }
}
