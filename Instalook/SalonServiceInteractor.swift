//
//  SalonServiceInteractor.swift
//  Instalook
//
//  Created by jets on 9/24/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class SalonServiceInteractor{
//    public func callAPIAddSalonService(onSuccess successCallback: ((_ salonService: [SalonServiceModel]) -> Void)?,
//                                onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
//        APICallManager.instance.callAPIAddSalonService(onSuccess:{ (salonService) in
//            successCallback?(salonService)
//        } , onFailure: { (errorMessage) in
//            failureCallback?(errorMessage)
//        })
//    }
    
    
    
//    
    func addService(salonId: String, salon: SalonServiceModel) {
        APICallManager.instance.AddServiceRequest(salonId: salonId,salon: salon)
    }
}
