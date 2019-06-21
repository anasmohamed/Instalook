//
//  BarberDetailViewController.swift
//  Instalook
//
//  Created by jets on 6/20/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit

class BarberDetailViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let addBarberBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(BarberDetailViewController.addBarber))
        self.navigationItem.rightBarButtonItem  = addBarberBtn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addBarber() {
    
    }
}
