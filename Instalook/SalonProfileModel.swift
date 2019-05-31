//
//  SalonProfile.swift
//  Instalook
//
//  Created by jets on 9/22/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation

class SalonProfileModel {
    var id: Int?
    var salonName: String?
    var salonEmail: String?
    var salonLocation: String?
    var salonType: String?
    
    func loadFromDictionary(_ dict: [String: AnyObject]) {
        if let data = dict["salonId"] as? Int {
            self.id = data
        }
        if let data = dict["salonName"] as? String {
            self.salonName = data
        }
        if let data = dict["salonEmail"] as? String {
            self.salonEmail = data
        }
        if let data = dict["salonLocation"] as? String {
            self.salonLocation = data
        }
        if let data = dict["salonType"] as? String {
            self.salonType = data
        }
       
    }
    
    // MARK: Class Method
    class func build(_ dict: [String: AnyObject]) -> SalonProfileModel {
        let profile = SalonProfileModel()
        profile.loadFromDictionary(dict)
        return profile
    }
 

    

}
