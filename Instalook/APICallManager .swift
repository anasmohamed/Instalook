//
//  APICallManager .swift
//  Instalook
//
//  Created by jets on 9/22/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation


import Alamofire
import SwiftyJSON
import Foundation

let API_BASE_URL = "https://instalook-api.herokuapp.com"

class APICallManager {
    static let instance = APICallManager()
    
    enum RequestMethod {
        case get
        case post
    }
    
    enum Endpoint: String {
         case Salon = "/salon/getSalons"
       // case Salon = "/salon/getSalonsById/12"
        
    }
    
    
    
    // MARK: Salon API
    func callAPIGetSalon(onSuccess successCallback: ((_ salonData: [SalonProfileModel]) -> Void)?,
                          onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        // Build URL
        let url = API_BASE_URL + Endpoint.Salon.rawValue
        
        // call API
        self.createRequest(
            url, method: .get, headers: nil, parameters: nil,
            onSuccess: {(responseObject: JSON) -> Void in
                // Create dictionary
               
                if let responseDict = responseObject.arrayObject {
                let salonDict = responseDict as! [[String:AnyObject]]
                    
                    // Create object
                    var data = [SalonProfileModel]()
                    for item in salonDict {
                       // print(item)
                        let single = SalonProfileModel.build(item)
                        data.append(single)
                    }
                    //print("\(data)")
                    // Fire callback
                    successCallback?(data)
                } else {
                    failureCallback?("An error has occured.")
                }
        },
            onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
                print(errorMessage)
        }
        )
    }

    
    // MARK: Request Handler
    // Create request
    func createRequest(
        _ url: String,
        method: HTTPMethod,
        headers: [String: String]?,
        parameters: AnyObject?,
        onSuccess successCallback: ((JSON) -> Void)?,
        onFailure failureCallback: ((String) -> Void)?
        ) {
        
        Alamofire.request(url, method: method).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                successCallback?(json)
            case .failure(let error):
                if let callback = failureCallback {
                    // Return
                    callback(error.localizedDescription)
                }
            }
        }
    }
}

