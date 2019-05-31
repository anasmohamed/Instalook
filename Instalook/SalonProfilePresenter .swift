//
//  SalonProfileVCPresenter .swift
//  Instalook
//
//  Created by jets on 9/22/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation
/*
 
 struct PeopleViewData{
 let name: String
 let email: String
 }
 
 protocol PeopleView: NSObjectProtocol {
 func startLoading()
 func finishLoading()
 func setPeople(people: [PeopleViewData])
 func setEmptyPeople()
 }
 
 class PeoplePresenter {
 private let peopleService:PeopleService
 weak private var peopleView : PeopleView?
 
 init(peopleService:PeopleService) {
 self.peopleService = peopleService
 }
 
 func attachView(view:PeopleView) {
 peopleView = view
 }
 
 func detachView() {
 peopleView = nil
 }
 
 func getPeople() {
 self.peopleView?.startLoading()
 peopleService.callAPIGetPeople(
 onSuccess: { (people) in
 self.peopleView?.finishLoading()
 if (people.count == 0){
 self.peopleView?.setEmptyPeople()
 } else {
 let mappedUsers = people.map {
 return PeopleViewData(name: "\($0.name!)", email: "\($0.email!)")
 }
 self.peopleView?.setPeople(people: mappedUsers)
 }
 },
 onFailure: { (errorMessage) in
 self.peopleView?.finishLoading()
 }
 )
 }
 }

 */

struct SalonViewData{
 //   var salonId : Int?
    var salonName: String?
    var salonEmail: String?
   /* var salonLocation: String?
    var salonType: String?
 */
}

protocol SalonView: NSObjectProtocol {
  
    func showIndicator()
    func hideIndicator()
    func setSalon(salon : [SalonViewData])
    func setEmptySalon()

}


class SalonProfilePresenter {
    
    private weak var salonView: SalonView?
    private var salonInteractor = SalonProfileInteractor()

    
    init(salonInteractor : SalonProfileInteractor) {
        self.salonInteractor = salonInteractor
    }
    
    func attachView(view:SalonView) {
        salonView = view
    }
    
    func detachView() {
        salonView = nil
    }

    
    func getSalonData() {
        self.salonView?.showIndicator()
        salonInteractor.callAPIGetSalon(
            onSuccess: { (salon) in
                self.salonView?.hideIndicator()
                if (salon.count == 0){
                    self.salonView?.setEmptySalon()
                } else {
                    let mappedUsers = salon.map {
                       return SalonViewData(salonName: "\($0.salonName!)", salonEmail: "\($0.salonEmail!)")
                    }
                    self.salonView?.setSalon(salon: mappedUsers)
                }
        },
            onFailure: { (errorMessage) in
                self.salonView?.hideIndicator()
        }
        )
}
}
