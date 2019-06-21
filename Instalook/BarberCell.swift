//
//  BarberCell.swift
//  Instalook
//
//  Created by jets on 6/19/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit

class BarberCell: UITableViewCell, BarberCellView {

    @IBOutlet var barberNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func displayBarberName(barberName: String) {
        barberNameLabel.text = barberName
    }
    
}
