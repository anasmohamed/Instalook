//
//  BarberViewController.swift
//  Instalook
//
//  Created by Amer Shaker on 6/17/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit

class BarberViewController: UITableViewController {
    
    // MARK: Outlets
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: BarberPresenter!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = BarberPresenter(view: self)
        presenter.viewDidLoad()
    }
    
    // MARK: Actions
    @IBAction func addNewBarber(_ sender: UIBarButtonItem) {
        let salonId = 202
        let barber = Barber()
        barber.firstName = "Shaker"
        barber.lastName = "Othman"
        barber.role = "Barber"
        barber.rate = 5
        barber.isAvailable = 1
        presenter.addBarber(salonId: salonId, barber: barber)
    }
    
    // MARK: TableView
    func setupTableView() {
        tableView.register(UINib(nibName: "BarberCell", bundle: nil), forCellReuseIdentifier: "BarberCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getBarbersCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarberCell", for: indexPath) as! BarberCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let barberName = presenter.getBarberName(index: indexPath.row)
            let title = "Delete \(barberName)"
            let message = "Are you sure you want to delete this barber?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { [unowned self] (action) -> Void in
                                                // Remove the service from the services array
                                                self.presenter.deleteBarber(indexPath: indexPath)
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }

    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        /*case "showBarber"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it along
                let barber = itemStore.allItems[row]
                let detailViewController = segue.destination as! BarberDetailViewController
                detailViewController.item = item
            }*/
        case "addBarber"?:
            let barberDetailViewController = segue.destination as! BarberDetailViewController
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }*/
}
