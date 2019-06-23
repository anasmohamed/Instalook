//
//  ServiceDetailView.swift
//  Instalook
//
//  Created by Amer Shaker on 6/24/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

protocol ServiceDetailView: class {
    func showIndicator()
    func hideIndicator()
    func resetForm()
    func addServiceSuccess()
    func updateServiceSuccess()
    func showError(error: String)
}
