//
//  ServiceDetailPresenter.swift
//  Instalook
//
//  Created by jets on 6/24/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

class ServiceDetailPresenter {
    
    private weak var view: ServiceDetailView?
    private let serviceInteractor: ServiceInteractor
    private var service: Service?
    
    init(view: ServiceDetailView) {
        self.view = view
        serviceInteractor = ServiceInteractor()
    }
    
    func addService(salonId: Int,
                    serviceName: String,
                    serviceType: String,
                    servicePrice: Double) {

        if salonId != 0,
            !isEmpty(string: serviceName),
            !isEmpty(string: serviceType) {
            
            let service = Service()
            service.serviceName = serviceName
            service.serviceType = serviceType
            service.servicePrice = servicePrice
            
            view?.showIndicator()
            serviceInteractor.addService(salonId: salonId, service: service) { [unowned self] error in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    self.view?.addServiceSuccess()
                    self.view?.resetForm()
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
    
    // MARK: Validation methods
    private func isEmpty(string: String) -> Bool {
        return string.isEmpty
    }
}
