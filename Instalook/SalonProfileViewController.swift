//
//  ViewController.swift
//  Instalook
//
//  Created by Amer Shaker on 6/17/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit

class SalonProfileViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var salonNameLabel: UILabel!
    @IBOutlet weak var salonProfileImageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: SalonProfilePresenter!

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SalonProfilePresenter(view: self)
        presenter.getSalonById(salonId: 172)
        
        Utils.roundImage(imageView: salonProfileImageView)
    }
}
