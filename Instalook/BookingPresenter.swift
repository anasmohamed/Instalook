//
//  BookingPresenter.swift
//  Instalook
//
//  Created by jets on 10/17/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import Foundation
class BookingPresenter{
    
    private weak var view: BookingView?
    private let bookingInteractor: BookingInteractor
    private var booking: Booking?
    private var bookings: [Booking]
    
    init(view: BookingView) {
        self.view = view
        bookingInteractor = BookingInteractor()
        bookings = [Booking]()
    }
    
    func viewDidLoad() {
        getBarberBooking(barberId: 62)
    }
    
   
    
    func getBarberBooking(barberId: Int) {
        
        if barberId != 0 {
            
            view?.showIndicator()
            bookingInteractor.getBarberBookings(barberId: barberId) { [unowned self] (bookings, error) in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    guard let bookings = bookings else { return }
                    self.bookings = bookings
                    self.view?.getBarberBookingsSuccess()
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
    
    func getBookingsCount() -> Int {
        return bookings.count
    }
    
    func configure(cell: BookingCellView, for index: Int) {
        let booking = bookings[index]
        guard let userName = booking.userName,
            let barberName = booking.barberName
            ,
            let bookTime = booking.bookingTime
            else { return }
        
        cell.displayUserName(userName: userName)
        cell.displayBaberName(barberName: barberName)
        cell.displayBookTimeName(bookTime:bookTime)
    }
}
