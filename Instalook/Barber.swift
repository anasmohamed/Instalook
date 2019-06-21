//
//  Barber.swift
//  Instalook
//
//  Created by Amer Shaker on 6/4/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation
import ObjectMapper

class Barber: Mappable {
    
    var barberId: Int?
    var firstName: String?
    var lastName: String?
    var role: String?
    var rate: Int?
    var isAvailable: Int?

    init() {
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        barberId <- map[NetworkingConstants.barberId]
        firstName <- map[NetworkingConstants.barberFirstName]
        lastName <- map[NetworkingConstants.barberLastName]
        role <- map[NetworkingConstants.barberRole]
        rate <- map[NetworkingConstants.barberRate]
        isAvailable <- map[NetworkingConstants.isAvailable]
    }
}
