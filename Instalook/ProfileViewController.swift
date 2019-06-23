//
//  ViewController.swift
//  Instalook
//
//  Created by Amer Shaker on 6/17/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit
import Cosmos

class ProfileViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet var salonNameLabel: UILabel!
    @IBOutlet var salonTypeLabel: UILabel!
    @IBOutlet var salonRatingView: CosmosView!
    @IBOutlet weak var salonProfileImageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: ProfilePresenter!

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProfilePresenter(view: self)
        presenter.getSalonById(salonId: 202)
    }
    
    // MARK: Actions
    @IBAction func signOut(_ sender: UIBarButtonItem) {
        presenter.signOut()
    }
}
