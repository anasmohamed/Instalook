//
//  BarberViewController.swift
//  Instalook
//
//  Created by jets on 10/14/1440 AH.
//  Copyright © 1440 AH instalook. All rights reserved.
//

import UIKit

class BarberViewController: UITableViewController {

    // MARK: Outlets
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: BarberPresenter!
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = BarberPresenter(view: self)
        presenter.viewDidLoad()
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

 func setupTableView()
 {
    
    tableView.register(UINib(nibName: "BarberCell", bundle: nil), forCellReuseIdentifier: "BarberCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presenter.getBarbersCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarberCell", for: indexPath) as! BarberCell
        
        


        return cell
    }
    
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


