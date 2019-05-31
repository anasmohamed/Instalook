//
//  SalonProfileInteractor.swift
//  Instalook
//
//  Created by jets on 9/22/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation
import Alamofire


class SalonProfileInteractor {

    
    public func callAPIGetSalon(onSuccess successCallback: ((_ salonData :[SalonProfileModel]) -> Void)?,
      
                                 onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
       
    APICallManager.instance.callAPIGetSalon(
            onSuccess: { (salonData) in
                successCallback?(salonData)
        },
            onFailure: { (errorMessage) in
                failureCallback?(errorMessage)
        }
        )
    }
    
}
