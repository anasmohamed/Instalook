//
//  ServiceView.swift
//  Instalook
//
//  Created by Amer Shaker on 6/16/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

protocol ServiceView: class {
    func showIndicator()
    func hideIndicator()
    func addServiceSuccess()
    func getAllServicesSuccess()
    func deleteServiceSuccess(indexPath: IndexPath)
    func showError(error: String)
}
