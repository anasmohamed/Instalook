//
//  ServiceCell.swift
//  Instalook
//
//  Created by Amer Shaker on 6/18/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit

class ServiceCell: UITableViewCell, ServiceCellView {
    
    @IBOutlet var serviceNameLabel: UILabel!
    @IBOutlet var serviceTypeLabel: UILabel!
    @IBOutlet var servicePriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func displayServiceName(serviceName: String) {
        serviceNameLabel.text = serviceName
    }
    
    func displayServiceType(serviceType: String) {
        serviceTypeLabel.text = serviceType
    }
    
    func displayServicePrice(servicePrice: Double) {
        servicePriceLabel.text = "$ \(servicePrice)"
    }
}
