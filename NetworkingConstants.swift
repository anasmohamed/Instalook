//
//  NetworkingConstants.swift
//  Instalook
//
//  Created by Amer Shaker on 6/3/19.
//  Copyright © 2019 instalook. All rights reserved.
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
    static let addSalon = "add"
    static let getSalons = "getSalons"
    static let getSalonsById = "getSalonsById"
    
    // Salon Query Parameters
    static let salonId = "salonId"
    static let salonName = "salonName"
    static let salonEmail = "salonEmail"
    static let salonPassword = "salonPassword"
    static let salonLocation = "salonLocation"
    static let salonType = "salonType"
    
    // Salon Service Query Parameters
    static let serviceId = "serviceId"
    static let serviceName = "serviceName"
    static let serviceType = "serviceType"
    static let servicePrice = "servicePrice"
    
    // Salon Service Requests
    static let addService = "add"
}
