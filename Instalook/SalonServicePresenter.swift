//
//  SalonServicePresenter.swift
//  Instalook
//
//  Created by jets on 9/24/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation


protocol SalonServiceView: NSObjectProtocol {
    
    func notifyAddServiceSuccessful()
    func notifyAddServiceError()
    
}

class SalonServicePresenter{
    
    private weak var salonServiceView: SalonServiceView?
    private var salonServiceInteractor = SalonServiceInteractor()
    
    
     init(salonServiceView : SalonServiceView) {
        self.salonServiceView = salonServiceView
    }
  
    
    
    func addSalonServiceData(salonId:String, salon :SalonServiceModel) {
        salonServiceInteractor.addService(salonId: salonId, salon: salon)
//        salonServiceInteractor.callAPIAddSalonService(onSuccess: {
//            (salonService) in
//           
//          
//                _ = salonService.map {
//                    return SalonServiceModel(id: $0.id!,name: $0.name!,type: $0.type!,price: $0.price!)
//                
//               // self.salonView?.setSalon(salon: mappedUsers)
//            }
//        }, onFailure: {(errorMessage) in
//            //self.salonView?.finishLoading()
//        }
//        )
        
    }
    
}
