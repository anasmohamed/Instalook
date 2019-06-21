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
    
    // Salon
    case login(email: String, password: String)
    case register(salon: Salon)
    case getSalonById(salonId: Int)
    case search()
    
    // Barber
    case addBarber(salonId: Int, barber: Barber)
    case getAllBarbers(salonId: Int)
    case getBookings(barberId: Int)
    
    
    // Service
    case addService(salonId: Int, service: Service)
    case getAllServices(salonId: Int)
    
    var path: String {
        
        switch self {
        case .login:
            return NetworkingConstants.salonRequestMapping + "/" + NetworkingConstants.login
        case .register:
            return NetworkingConstants.salonRequestMapping + "/" + NetworkingConstants.register
        case .getSalonById:
            return NetworkingConstants.salonRequestMapping + "/" + NetworkingConstants.getSalonById
        case .search:
            return NetworkingConstants.salonRequestMapping + "/" + NetworkingConstants.getSalons
        case .addBarber:
            return NetworkingConstants.barberRequestMapping + "/" + NetworkingConstants.addBarber
        case .getAllBarbers:
            return NetworkingConstants.barberRequestMapping + "/" + NetworkingConstants.getAllBarbers
        case .addService:
            return NetworkingConstants.serviceRequestMapping + "/" + NetworkingConstants.addService
        case .getAllServices:
            return NetworkingConstants.serviceRequestMapping + "/" + NetworkingConstants.getAllServices
        case .getBookings:
            return NetworkingConstants.salonRequestMapping + "/" +
                NetworkingConstants.getBookings
        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        case .login, .register, .getSalonById, .addBarber, .getAllBarbers, .addService, .getAllServices, .getBookings:
            return .post
        case .search:
            return .get
        }
    }
    
    var httpHeaders: HTTPHeaders {
        
        var httpHeaders = [String:String]()
        
        switch self {
        case .register, .addBarber, .addService:
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
            
        case let .addBarber(salonId, barber):
            var barberBody = [String:Any]()
            barberBody[NetworkingConstants.barberFirstName] = barber.firstName!
            barberBody[NetworkingConstants.barberLastName] = barber.lastName!
            barberBody[NetworkingConstants.barberRole] = barber.role!
            barberBody[NetworkingConstants.barberRate] = barber.rate!
            barberBody[NetworkingConstants.isAvailable] = barber.isAvailable!
            
            body[NetworkingConstants.salonId] = salonId
            body["barber"] = barberBody
            
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
        case let .getSalonById(salonId):
            params[NetworkingConstants.salonId] = salonId
        case let .getAllBarbers(salonId):
            params[NetworkingConstants.salonId] = salonId
        case let .getAllServices(salonId):
            params[NetworkingConstants.salonId] = salonId
        case let .getBookings(barberId):
            params[NetworkingConstants.barberId] = barberId
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
        case .login, .getSalonById, .search, .getAllBarbers, .getAllServices, .getBookings:
            return try URLEncoding.methodDependent.encode(urlRequest, with: params)
        case .register, .addBarber, .addService:
            return try JSONEncoding.default.encode(urlRequest, with: body)
        }
    }
}
