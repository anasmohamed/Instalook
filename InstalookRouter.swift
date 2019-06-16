//
//  InstalookRouter.swift
//  Instalook
//
//  Created by Amer Shaker on 6/3/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation
import Alamofire

enum InstalookRouter: URLRequestConvertible {
    
    case login(email: String, password: String)
    case register(salon: Salon)
    case search()
    case addService(salonId: Int, service: Service)
    
    var path: String {
        
        switch self {
        case .login:
            return NetworkingConstants.salonRequestMapping + "/" + NetworkingConstants.login
        case .register:
            return NetworkingConstants.salonRequestMapping + "/" + NetworkingConstants.register
        case .search:
            return NetworkingConstants.salonRequestMapping + "/" + NetworkingConstants.getSalons
        case .addService:
            return NetworkingConstants.serviceRequestMapping + "/" + NetworkingConstants.addService
        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        case .login, .register, .addService:
            return .post
        case .search:
            return .get
        }
    }
    
    var httpHeaders: HTTPHeaders {
        
        var httpHeaders = [String:String]()
        
        switch self {
        case .register, .addService:
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
        case let .register(salon):
            body[NetworkingConstants.salonName] = salon.salonName!
            body[NetworkingConstants.salonEmail] = salon.salonEmail!
            body[NetworkingConstants.salonPassword] = salon.salonPassword!
            body[NetworkingConstants.salonLocation] = salon.salonLocation!
            body[NetworkingConstants.salonType] = salon.salonType!
        case let .addService(salonId, service):
            
            var serviceBody = [String:Any]()
            serviceBody[NetworkingConstants.serviceName] = service.serviceName!
            serviceBody[NetworkingConstants.serviceType] = service.serviceType!
            serviceBody[NetworkingConstants.servicePrice] = service.servicePrice!
            
            body[NetworkingConstants.salonId] = salonId
            body["service"] = serviceBody
        default:
            print("Empty request body")
        }
        
        return body
    }
    
    var params: [String: Any] {
        
        var params = [String:Any]()
        
        switch self {
        case let .login(email, password):
            params[NetworkingConstants.salonEmail] = email
            params[NetworkingConstants.salonPassword] = password
        default:
            print("Empty request params")
        }
        
        return params
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = try NetworkingConstants.baseURL.asURL()
        
        // URL Request Components
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = httpHeaders
        
        switch self {
        case .login, .search:
            return try URLEncoding.methodDependent.encode(urlRequest, with: params)
        case .register, .addService:
            return try JSONEncoding.default.encode(urlRequest, with: body)
        }
    }
}
