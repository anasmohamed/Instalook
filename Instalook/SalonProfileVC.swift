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
    
    @IBOutlet weak var viewsContainer: UIView!
    var views :[UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        views = [UIView]()
        setupCollectionView()
        Utils.roundBtn(button: salonFollowBtn)
        Utils.roundImage(imageView: salonProfileImage)
        
        activityIndicator?.hidesWhenStopped = true
        presenter.attachView(view: self)
        presenter.getSalonData()
        views.append(SalonServices().view)
        for v in views{
            viewsContainer.addSubview(v)
        }
        viewsContainer.bringSubview(toFront: views[0])
        
        let service = Service()
        service.serviceName = "Amer's Service"
        service.serviceType = "Males"
        service.servicePrice = 100.0
        
        let interactor = ServiceInteractor()
        interactor.addService(salonId: 122, service: service, completionHandler: { error in
            print("Success")
        })
    }
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        self.viewsContainer.bringSubview(toFront: views[sender.selectedSegmentIndex])
    }

}
