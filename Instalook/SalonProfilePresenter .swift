//
//  SalonProfileVCPresenter .swift
//  Instalook
//
//  Created by jets on 9/22/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation


struct PeopleViewData{
    let name: String
    let email: String
}

protocol SalonView: NSObjectProtocol {
   /* func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    func setPeople(people: [PeopleViewData])
    func setEmptyPeople()
 */
    
    func startLoading()
    func finishLoading()
    func setPeople(people: [PeopleViewData])
    func setEmptyPeople()

}


class SalonProfilePresenter {
    
    private weak var salonView: SalonView?
    private var salonInteractor = SalonProfileInteractor()
   // private var users = [User]()
    
 /*
    init(salonProfileInteractor:SalonProfileInteractor) {
        self.salonInteractor = salonProfileInteractor
    }*/
    
    
//    init(view: SalonView) {
//        self.salonView = view
//    }
// 
    
    
    func getPeople() {
        self.salonView?.startLoading()
        salonInteractor.callAPIGetPeople(
            onSuccess: { (people) in
                self.salonView?.finishLoading()
                if (people.count == 0){
                    self.salonView?.setEmptyPeople()
                } else {
                    let mappedUsers = people.map {
                        return PeopleViewData(name: "\($0.name!)", email: "\($0.email!)")
                    }
                    self.salonView?.setPeople(people: mappedUsers)
                }
        },
            onFailure: { (errorMessage) in
                self.salonView?.finishLoading()
        }
        )
}
}
   /* func getUsers() {
        salonView?.sh
        salonInteractor.callAPIGetPeople(
            onSuccess: { (people) in
               // self.peopleView?.finishLoading()
                if (people.count == 0){
                  //  self.peopleView?.setEmptyPeople()
                } else {
                    let mappedUsers = people.map {
                        print("success")
                        return PeopleViewData(name: "\($0.salonName!)", email: "\($0.salonEmail!)")
                    }
                    // self.peopleView?.setPeople(people: mappedUsers)
                }
        },
            onFailure: { (errorMessage) in
           //     self.peopleView?.finishLoading()
        }
        )
        /*
        interactor.callAPIGetPeople { [weak self] users, error in
            guard let self = self else { return } //And note this is only available from swift 4.2
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let users = users else { return }
                self.users = users
                self.view?.fetchingDataSuccess()
            }
        }
 */
    }
    
   /* func getUsersCount() -> Int {
        return users.count
    }
    
/*    func configure(cell: UserCellView, for index: Int) {
        let user = users[index]
        cell.displayName(name: user._name)
        cell.displayEmail(email: user._email)
        cell.displayAddress(address: "\(user._address._street) \(user._address._suite)")
    }
    */

}*/*/
