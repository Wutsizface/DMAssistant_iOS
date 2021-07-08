//
//  ViewController.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 6/1/21.
//

import UIKit

class MonstersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var monsters = [MonsterIndex]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MonsterAPI.fetchAllMonsters { (result) in
            DispatchQueue.main.async{
                switch result{
                case.success(let monsters):
                    self.monsters = monsters
                    self.tableView.reloadData()
                case.failure(let error):
                    print(error)
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        monsters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "monsterCell", for: indexPath)
        cell.textLabel?.text = monsters[indexPath.row].name
        return cell
    }
    
}
