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

let API_BASE_URL = "http://api.nandawperdana.com"

class APICallManager {
    static let instance = APICallManager()
    
    enum RequestMethod {
        case get
        case post
    }
    
    enum Endpoint: String {
        case People = "/people.json"
        case Salon = "/getSalon.json"
    }

    
    // MARK: People API
    func callAPIGetPeople(onSuccess successCallback: ((_ people: [PeopleModel]) -> Void)?,
                          onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        // Build URL
        let url = API_BASE_URL + Endpoint.People.rawValue
        
        // call API
        self.createRequest(
            url, method: .get, headers: nil, parameters: nil,
            onSuccess: {(responseObject: JSON) -> Void in
                // Create dictionary
                if let responseDict = responseObject["data"].arrayObject {
                    let peopleDict = responseDict as! [[String:AnyObject]]
                    
                    // Create object
                    var data = [PeopleModel]()
                    for item in peopleDict {
                        print(item)
                        let single = PeopleModel.build(item)
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
        }
        )
    }

    // MARK: Salon API
    func callAPIGetSalon(onSuccess successCallback: ((_ salon: [SalonProfileModel]) -> Void)?,
                          onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        // Build URL
        let url = API_BASE_URL + Endpoint.Salon.rawValue
        
        // call API
        self.createRequest(
            url, method: .get, headers: nil, parameters: nil,
            onSuccess: {(responseObject: JSON) -> Void in
                // Create dictionary
                if let responseDict = responseObject["data"].arrayObject {
                    let salonDict = responseDict as! [[String:AnyObject]]
                    
                    // Create object
                    var data = [SalonProfileModel]()
                    for item in salonDict {
                        let single = SalonProfileModel.build(item)
                        data.append(single)
                    }
         
                // Fire callback
                    successCallback?(data)
                } else {
                    failureCallback?("An error has occured.")
                }
        },
            onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
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
