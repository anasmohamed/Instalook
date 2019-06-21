//
//  Booking.swift
//  Instalook
//
//  Created by jets on 10/17/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation
import ObjectMapper

class Booking: Mappable {
    var userName : String?
    var bookingTime : Double?
    var barberName : String?
    
    
    init() {
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        userName <- map[NetworkingConstants.serviceId]
        bookingTime <- map[NetworkingConstants.serviceName]
        barberName <- map[NetworkingConstants.serviceType]
    }
    
}
