//
//  BookingCell.swift
//  Instalook
//
//  Created by jets on 10/17/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import UIKit

class BookingCell: UITableViewCell,BookingCellView {

    @IBOutlet weak var bookTimeLabel: UILabel!
    @IBOutlet weak var barberNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func displayUserName(userName: String) {
        userNameLabel.text = userName
    }
    func displayBaberName(barberName: String) {
        barberNameLabel.text = barberName
    }
    func displayBookTimeName(bookTime: Double
        
        ) {
        let date = NSDate(timeIntervalSince1970: Double(bookTime) / 1000)
        //let formatter = DateFormatter()
        //formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        //formatter.dateFormat = "YYYY MM DD HH mm"
        //bookTimeLabel.text = formatter.string(from: date as Date)
        bookTimeLabel.text = String(describing: date)
    }
}
