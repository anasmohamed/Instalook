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
        
        Alamofire.request(InstalookRouter.getAllBarbers(salonId: barberId)).responseArray {
            (response: DataResponse<[Booking]>) in
            let result = response.result
            switch result {
            case .success(let bookings):
                completionHandler(bookings, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}
