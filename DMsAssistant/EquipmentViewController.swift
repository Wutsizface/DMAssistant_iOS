//
//  EquipmentViewController.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 6/17/21.
//

import UIKit

class EquipmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var equipment = [EquipmentIndex]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        equipment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "equipmentCell", for: indexPath)
        cell.textLabel?.text = equipment[indexPath.row].name
        return cell
    }
    
    @IBOutlet weak var equipmentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        EquipmentAPI.fetchAllEquipment { (result) in
            DispatchQueue.main.async{
                switch result{
                case.success(let equipment):
                    self.equipment = equipment
                    self.equipmentTableView.reloadData()
                case.failure(let error):
                    print(error)
                default: break
                }
            }
        }
    }
    @IBOutlet weak var tableView: UITableView!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow, let destination = segue.destination as? EquipmentDetailViewController else {
            return
        }
        let selectedEquipment = equipment [index.row]
        destination.equipmentDetailIndex = selectedEquipment.index
      
    }
}
