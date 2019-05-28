//
//  SalonProfilePresenter+.swift
//  Instalook
//
//  Created by jets on 9/23/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation


extension SalonProfileVC : SalonView {
    func startLoading() {
        // Show your loader
        //  activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        // Dismiss your loader
        //    activityIndicator?.stopAnimating()
    }
    
    func setPeople(people: [PeopleViewData]) {
      //  peopleToDisplay = people
        /*   tableView?.isHidden = false
         tableView?.reloadData()
         */
    }
    
    func setEmptyPeople() {
        //         tableView?.isHidden = true
    }
}
