//
//  SalonService.swift
//  Instalook
//
//  Created by Amer Shaker on 6/4/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation
import ObjectMapper

class Service: Mappable {
    
    var serviceId: Int?
    var serviceName: String?
    var serviceType: String?
    var servicePrice: Double?
    
    init() {
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        serviceId <- map[NetworkingConstants.serviceId]
        serviceName <- map[NetworkingConstants.serviceName]
        serviceType <- map[NetworkingConstants.serviceType]
        servicePrice <- map[NetworkingConstants.servicePrice]
    }
}
