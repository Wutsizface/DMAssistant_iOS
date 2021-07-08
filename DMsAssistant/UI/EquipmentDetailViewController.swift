//
//  EquipmentDetailViewController.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 6/30/21.
//

import UIKit

class EquipmentDetailViewController: UITableViewController {
    var equipmentDetailIndex: String?
    @IBOutlet weak var equipmentName: UILabel!
    @IBOutlet weak var equipmentCategory: UILabel!
    @IBOutlet weak var equipmentCost: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let equipmentDetailIndex = equipmentDetailIndex else {
            return
        }
        EquipmentAPI.fetchEquipmentDetails(index: equipmentDetailIndex) {[weak self] (result) in
            DispatchQueue.main.async{
                switch result{
                case.success(let details):
                    self?.equipmentName.text = details.name
                    self?.equipmentCategory.text = details.equipment_category.name
                    let cost = "\(details.cost.quantity)" + details.cost.unit
                    self?.equipmentCost.text = cost
                case.failure(let error):
                    print(error)
                default: break
                }
            }
        }
    }
}
