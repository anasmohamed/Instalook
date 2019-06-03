//
//  SalonServiceVC.swift
//  Instalook
//
//  Created by jets on 9/22/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import UIKit

class SalonServiceVC: UIViewController {
    var salonServicePresenter : SalonServicePresenter?
    
    var salon:SalonServiceModel?
    @IBAction func addServiceBtn(_ sender: Any) {
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        salon = SalonServiceModel(name: "anas",type: "3000",price: "anas")
       
          salonServicePresenter = SalonServicePresenter(salonServiceView: self)
//          salonServicePresenter?.addSalonServiceData()
        salonServicePresenter?.addSalonServiceData(salonId: "12",salon: salon!)
        // Do any additional setup after loading the view.
    }


}
