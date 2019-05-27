//
//  SalonProfileVC+ImagesCollectionView.swift
//  Instalook
//
//  Created by jets on 9/22/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//


import UIKit

extension SalonProfileVC:UICollectionViewDelegate,UICollectionViewDataSource
{
    func setupCollectionView() -> Void {
        salonImagesCollectionView.delegate = self
        salonImagesCollectionView.dataSource = self
        salonImagesCollectionView.register(UINib(nibName: "SalonImagesCellCollectionViewCell",bundle:nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SalonImagesCellCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return cell
    }
}

