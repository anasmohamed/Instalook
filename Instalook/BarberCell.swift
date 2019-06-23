//
//  BarberCell.swift
//  Instalook
//
//  Created by jets on 6/19/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit
import Cosmos

class BarberCell: UITableViewCell, BarberCellView {

    @IBOutlet var barberNameLabel: UILabel!
    @IBOutlet var barberRoleLabel: UILabel!
    @IBOutlet var barberRatingView: CosmosView!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func displayBarberName(barberName: String) {
        barberNameLabel.text = barberName
    }
    
    func displayBarberRole(barberRole: String) {
        barberRoleLabel.text = barberRole
    }
    
    func displayBarberRating(barberRating: Double) {
        barberRatingView.rating = barberRating
    }
}
