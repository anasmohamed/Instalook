//
//  ViewController.swift
//  Instalook
//
//  Created by jets on 9/22/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import UIKit

let reuseIdentifier = "SalonImageCell"

class SalonProfileVC: UIViewController {
    @IBOutlet weak var salonImagesCollectionView: UICollectionView!
    let presenter = SalonProfilePresenter(salonInteractor :SalonProfileInteractor())
    var salonToDisplay = [SalonViewData]()
    
    @IBOutlet weak var salonNameLbl: UILabel!
    
    @IBOutlet weak var salonFollowBtn: UIButton!
    @IBOutlet weak var salonProfileImage: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        Utils.roundBtn(button: salonFollowBtn)
        Utils.roundImage(imageView: salonProfileImage)
        
        activityIndicator?.hidesWhenStopped = true
        
        presenter.attachView(view: self)
        presenter.getSalonData()
        
        //presenter.attachView(view: self as! SalonView)
      //  presenter.getPeople()
    }



}

