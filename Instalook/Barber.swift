//
//  Barber.swift
//  Instalook
//
//  Created by jets on 10/13/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation
import ObjectMapper

class Barber: Mappable {
    
    var barberId: Int?
    var firstName: String?
    var lastName: String?
    var isAvailable: Int?
    
    init() {
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        barberId <- map[NetworkingConstants.barberId]
        firstName <- map[NetworkingConstants.barberFirstName]
        lastName <- map[NetworkingConstants.barberLastName]
        isAvailable <- map[NetworkingConstants.isAvailable]
    }
}
