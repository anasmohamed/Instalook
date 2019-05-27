//
//  SalonInteractor.swift
//  Instalook
//
//  Created by jets on 9/22/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation


class SalaonInteractor {

    public func callAPIGetPeople(onSuccess successCallback: ((_ people: [PeopleModel]) -> Void)?,
                                 onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        APICallManager.instance.callAPIGetPeople(
            onSuccess: { (people) in
                successCallback?(people)
        },
            onFailure: { (errorMessage) in
                failureCallback?(errorMessage)
        }
        )
    }

}
