//
//  SpellsViewController.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 6/17/21.
//

import UIKit

class SpellsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var spells = [SpellIndex]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        spells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "spellsCell", for: indexPath)
        cell.textLabel?.text = spells[indexPath.row].desc
        return cell
    }

    @IBOutlet weak var spellsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SpellAPI.fetchAllSpells { (result) in
            DispatchQueue.main.async{
                switch result{
                case.success(let spells):
                    self.spells = spells
                    self.spellsTableView.reloadData()
                case.failure(let error):
                    print(error)
                default: break
                }
            }
        }
    }
}
