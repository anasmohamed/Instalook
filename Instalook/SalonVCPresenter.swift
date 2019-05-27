//
//  SalonVCPresenter.swift
//  Instalook
//
//  Created by jets on 9/22/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation


protocol SalonView : class {
 
    
    func showIndicator()
    func hideIndicator()
    func fetchDataSuccess()
    func showError(error : String)
    

}


class SalonVCPresenter{
    
    private weak var view : SalonView?
    private let interactor =  SalaonInteractor()
    

    
    
    
    

}
