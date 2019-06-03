//
//  InstalookRouter.swift
//  Instalook
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import Alamofire

enum InstalookRouter: URLRequestConvertible {
   
    case addService(salonId:String,salonServiceModel : SalonServiceModel)
    var path: String {
        
        switch self {
       
        
        case .addService:
            return NetworkingConstants.serviceRequestMapping + "/" + NetworkingConstants.addSerivce + "?salonId=12"
        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        case .addService:
            return .post
     
        }
    }
    
    var httpHeaders: HTTPHeaders {
        
        var httpHeaders = [String:String]()
        
        switch self {
        case .addService:
            httpHeaders[NetworkingConstants.accept] = NetworkingConstants.contentTypeJSON
            httpHeaders[NetworkingConstants.contentType] = NetworkingConstants.contentTypeJSON
        default:
            print("Empty request headers")
        }
        
        return httpHeaders
    }
    
    var body: [String: Any] {
        
        var body = [String:Any]()
        
        switch self {
        
        case let .addService(_, salonServiceModel):
            body["serivceName"] = salonServiceModel.name!
            body["serviceType"] = salonServiceModel.type!
            body["servicePrice"] = salonServiceModel.price!
        default:
            print("Empty request body")
        }
        
        return body
    }
    
//    var params: [String: Any] {
//        var params = [String:Any]()
//        switch self {
//        case let .login(email, password):
//            params[NetworkingConstants.email] = email
//            params[NetworkingConstants.password] = password
//            
//        default:
//            print("Empty request params")
//        }
//        
//        return params
//    }
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = try NetworkingConstants.baseURL.asURL()
        
        // URL Request Components
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = httpHeaders
        
        switch self {
             case  .addService:
            return try JSONEncoding.default.encode(urlRequest, with: body)
            
        }
    }
}
