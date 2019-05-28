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
    
   // var presenter: SalonProfileVCPresenter!
   /* let presenter = SalonProfileVCPresenter(s: SalonProfileInteractor)
    var peopleToDisplay = [PeopleViewData]()
    
    */
    
    let presenter = SalonProfilePresenter(view: self as! SalonView)
    var peopleToDisplay = [PeopleViewData]()
    

    @IBOutlet weak var salonFollowBtn: UIButton!
    @IBOutlet weak var salonProfileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        Utils.roundBtn(button: salonFollowBtn)
        Utils.roundImage(imageView: salonProfileImage)
        
        //presenter.attachView(view: self as! SalonView)
        presenter.getPeople()
    }



}

