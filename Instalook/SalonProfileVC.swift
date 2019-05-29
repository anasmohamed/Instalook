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
    let presenter = SalonProfilePresenter()
    var salonToDisplay = [SalonViewData]()
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var salonNameLbl: UILabel!
    @IBOutlet weak var salonFollowBtn: UIButton!
    @IBOutlet weak var salonProfileImage: UIImageView!
    @IBOutlet weak var viewsContainer: UIView!
    var views :[UIView]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        views = [UIView]()
        setupCollectionView()
        Utils.roundBtn(button: salonFollowBtn)
        Utils.roundImage(imageView: salonProfileImage)
        views.append(SalonServiceVC().view)
        views.append(SalonGiftsVC().view)
        for v in views{
            viewsContainer.addSubview(v)
        }
        viewsContainer.bringSubview(toFront: views[0])
        
        activityIndicator?.hidesWhenStopped = true
        
        presenter.attachView(view: self)
        presenter.getSalonData()
        
        //presenter.attachView(view: self as! SalonView)
      //  presenter.getPeople()
    }

    @IBAction func switchViews(_ sender: UISegmentedControl) {
        self.viewsContainer.bringSubview(toFront: views[sender.selectedSegmentIndex])
    }


}

