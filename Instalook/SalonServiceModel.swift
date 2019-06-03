//
//  SalonService.swift
//  Instalook
//
//  Created by jets on 9/24/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation
class SalonServiceModel{
    var id: Int?
    var name: String?
    var type: String?
    var price: String?
  
    init(name:String,type:String,price:String) {
        //self.id = id
        self.name = type
        self.price = price
        self.type = type
    }
}

