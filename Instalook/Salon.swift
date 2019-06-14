//
//  Salon.swift
//  Instalook
//
//  Created by Amer Shaker on 6/14/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation
import ObjectMapper

class Salon: Mappable {
    
    var salonId: Int?
    var salonName: String?
    var salonEmail: String?
    var salonPassword: String?
    var salonLocation: String?
    var salonType: String?
    
    init() {
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        salonId <- map[NetworkingConstants.salonId]
        salonName <- map[NetworkingConstants.salonName]
        salonEmail <- map[NetworkingConstants.salonEmail]
        salonPassword <- map[NetworkingConstants.salonPassword]
        salonLocation <- map[NetworkingConstants.salonLocation]
        salonType <- map[NetworkingConstants.salonType]
    }
}
