//
//  SalonProfilePresenter+.swift
//  Instalook
//
//  Created by jets on 9/23/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation


extension SalonProfileVC : SalonView {
    func showIndicator() {
        // Show your loader
          activityIndicator?.startAnimating()
    }
    
    func hideIndicator() {
        
        // Dismiss your loader
            activityIndicator?.stopAnimating()
    }
    
     func setSalon(salon : [SalonViewData]){
      salonNameLbl.text = salon[0].salonName
        
    }

    func setEmptySalon(){
        print("no data for this salon")
    
    }
   
    
}
