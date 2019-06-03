//
//  APICallManager .swift
//  Instalook
//
//  Created by jets on 9/22/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation


import Alamofire
import Foundation

//let API_BASE_URL = "http://api.nandawperdana.com"
let API_BASE_URL = "https://instalook-api.herokuapp.com"

class APICallManager {
    static let instance = APICallManager()
    
    enum RequestMethod {
        case get
        case post
    }
    
    enum Endpoint: String {
        case People = "/people.json"
        case Salon = "/getSalon.json"
        case SalonService = "/service/add?salonId=12"
    }
    
    
//    // MARK: AddSalonService API
//    func callAPIAddSalonService(onSuccess successCallback: ((_ salonService: [SalonServiceModel]) -> Void)?,
//                                onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
//        
//        // Build URL
//        // var id : String!
//        let url = API_BASE_URL + Endpoint.SalonService.rawValue
//        let parameters = [
//            "serviceName":"hairs cutTI",
//            "serviceType" : "ANAS",
//            "servicePrice": 500
//            ] as [String : Any]
//        
//        // call API
//        self.createRequest(
//            url , method: .post , headers:["Content-Type":"application/json"],parameters: parameters ,
//            onSuccess: {(responseObject: JSON) -> Void in
//                // Create dictionary
//                print(responseObject)
//        },
//            onFailure: {(errorMessage: String) -> Void in
//                failureCallback?(errorMessage)
//                print(errorMessage)
//                
//                
//        }
//        )
//    }
    
//    // MARK: Salon API
//    func callAPIGetSalon(onSuccess successCallback: ((_ salon: [SalonProfileModel]) -> Void)?,
//                         onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
//        
//        // Build URL
//        let url = API_BASE_URL + Endpoint.Salon.rawValue
//        
//        // call API
//        self.createRequest(
//            url, method: .get, headers: nil, parameters: nil,
//            onSuccess: {(responseObject: String) -> Void in
//                // Create dictionary
//                if let responseDict = responseObject["data"].arrayObject {
//                    let salonDict = responseDict as! [[String:AnyObject]]
//                    
//                    // Create object
//                    var data = [SalonProfileModel]()
//                    for item in salonDict {
//                        let single = SalonProfileModel.build(item)
//                        data.append(single)
//                    }
//                    
//                    // Fire callback
//                    successCallback?(data)
//                } else {
//                    failureCallback?("An error has occured.")
//                }
//        },
//            onFailure: {(errorMessage: String) -> Void in
//                failureCallback?(errorMessage)
//        }
//        )
//    }
//    
    
    func AddServiceRequest(salonId: String, salon: SalonServiceModel){
        Alamofire.request(InstalookRouter.addService(salonId: salonId, salonServiceModel: salon) ).response{response in
            print(response)
        }
    
    }
    // MARK: Request Handler
    // Create request
//    func createRequest(
//        _ url: URLConvertible,
//        method: HTTPMethod,
//        headers: HTTPHeaders?,
//        parameters: [String:Any]?,
//        
//        onSuccess successCallback: ((JSON) -> Void)?,
//        onFailure failureCallback: ((String) -> Void)?
//        ) {
//  
//        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).response { response in
//            
//            print(response.response!)
//        
////            switch response.response {
////               
////            case .none(let value):
////               let json = JSON(value)
////                successCallback?(json)
////            case .some(let error):
////                if let callback = failureCallback {
////                    // Return
////                    callback(error.localizedDescription)
////                    print("\n\n===========Error===========")
////                    print("Error Code: \(error._code)")
////                    print("Error Messsage: \(error.localizedDescription)")
////                    if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
////                        print("Server Error: " + str)
////                    }
////                    debugPrint(error as Any)
////                    print("===========================\n\n")
////                }
//            
//                
//                
////            }
//        }
//        
//        }
        
}
