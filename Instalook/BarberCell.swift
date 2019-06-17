//
//  BarberCellTableViewCell.swift
//  Instalook
//
//  Created by jets on 10/14/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import UIKit

class BarberCell: UITableViewCell, BarberCellView {
     func displayBaberName(barberName : String) {
        
    }


    @IBOutlet weak var barerNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    
}
