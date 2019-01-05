//
//  ControllerWithTableView.swift
//  Calanques
//
//  Created by Gary Luypaert on 03/01/2019.
//  Copyright © 2019 Gary Luypaert. All rights reserved.
//

import UIKit

class ControllerWithTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var calanques: [Calanque] = []
    var cellId = "Alternative"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        calanques = CalanqueCollection().all()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calanques.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let calanque = calanques[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? CalanqueCellAlternative {
            cell.calanque = calanque
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueID, sender: calanques[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID {
            if let vc = segue.destination as? DetailController {
                vc.calanqueReceveid = sender as? Calanque
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            calanques.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        calanques = CalanqueCollection().all()
        tableView.reloadData()
    }
    
    
}
