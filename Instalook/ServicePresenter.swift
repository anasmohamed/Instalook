//
//  ServicePresenter.swift
//  Instalook
//
//  Created by Amer Shaker on 6/16/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

class ServicePresenter {
    
    private weak var view: ServiceView?
    private let serviceInteractor: ServiceInteractor
    private var service: Service?
    private var services: [Service]
    
    init(view: ServiceView) {
        self.view = view
        serviceInteractor = ServiceInteractor()
        services = [Service]()
    }
    
    func viewDidLoad() {
        let salonId = UserDefaults.standard.integer(forKey: "salonId")
        getAllServices(salonId: salonId)
    }
    
    func addService(salonId: Int, service: Service) {
        
        if salonId != 0 {
            
            view?.showIndicator()
            serviceInteractor.addService(salonId: salonId, service: service) { [unowned self] error in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    self.view?.addServiceSuccess()
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
    
    func getAllServices(salonId: Int) {
        
        if salonId != 0 {
            
            view?.showIndicator()
            serviceInteractor.getAllServices(salonId: salonId) { [unowned self] (services, error) in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    guard let services = services else { return }
                    self.services = services
                    self.view?.getAllServicesSuccess()
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
    
    func deleteService(indexPath: IndexPath) {
        
        let row = indexPath.row
        
        if let serviceId = services[row].serviceId {

            view?.showIndicator()
            serviceInteractor.deleteServiceById(serviceId: serviceId) { [unowned self] (error) in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    let service = self.services[row]
                    self.removeService(service: service)
                    self.view?.deleteServiceSuccess(indexPath: indexPath)
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
    
    func getServicesCount() -> Int {
        return services.count
    }
    
    func getServiceName(index: Int) -> String {
        if let serviceName = services[index].serviceName {
            return serviceName
        } else {
            return ""
        }
    }
    
    func removeService(service: Service) {
        if let index = services.index(of: service) {
            services.remove(at: index)
        }
    }
    
    func configure(cell: ServiceCellView, for index: Int) {
        let service = services[index]
        guard let serviceName = service.serviceName,
            let serviceType = service.serviceType,
            let servicePrice = service.servicePrice else { return }
        
        cell.displayServiceName(serviceName: serviceName)
        cell.displayServiceType(serviceType: serviceType)
        cell.displayServicePrice(servicePrice: servicePrice)
    }
}
