//
//  NetworkingConstants.swift
//  Instalook
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation

struct NetworkingConstants {
    
    static let baseURL = "https://instalook-api.herokuapp.com"
    
    // Request Headers
    static let contentType = "Content-Type"
    static let accept = "Accept"
    static let contentTypeJSON = "application/json"
    
    // Request Mappings
    static let userRequestMapping = "user"
    static let salonRequestMapping = "salon"
    static let serviceRequestMapping = "service"
    
    // User Requests
    static let login = "login"
    static let register = "register"
    
    // User Query Parameters
    static let userId = "userId"
    static let firstName = "firstName"
    static let lastName = "lastName"
    static let email = "email"
    static let password = "password"
    
    // Salon Requests
    static let getSalons = "getSalons"
    static let getSalonsById = "getSalonsById"
    
    
    //Service Requests
    static let addSerivce = "add"

}
