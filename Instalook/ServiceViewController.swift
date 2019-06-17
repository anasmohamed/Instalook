//
//  SalonServices.swift
//  Instalook
//
//  Created by Amer Shaker on 6/17/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import UIKit

class ServiceViewController: UITableViewController {
    
    // MARK: Outlets
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: ServicePresenter!
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ServicePresenter(view: self)
        presenter.viewDidLoad()
    }
    
    // MARK: Actions
    @IBAction func addNewService(_ sender: UIButton) {
        let salonId = 172
        let service = Service()
        service.serviceName = "iOS"
        service.serviceType = "iOS"
        service.servicePrice = 100
        presenter.addService(salonId: salonId, service: service)
    }
    
    @IBAction func toggleEditingMode(_ button: UIButton) {
        if isEditing {
            button.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            button.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
    
    // MARK: TableView
    func setupTableView() {
        tableView.register(UINib(nibName: "ServiceCell", bundle: nil), forCellReuseIdentifier: "ServiceCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getServicesCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
}
