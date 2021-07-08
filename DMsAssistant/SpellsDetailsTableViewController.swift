//
//  SpellsDetailsTableViewController.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 7/6/21.
//

import UIKit

class SpellsDetailsTableViewController: UITableViewController {
    var spellsDetailIndex: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let spellsDetailIndex = spellsDetailIndex else {
            return
        }
        SpellAPI.fetchSpellsDetails(index: spellsDetailIndex) {[weak self] (result) in
            DispatchQueue.main.async{
                switch result{
                case.success(let details):
                    self?.spellsDescriptionLabel.text = details.desc
                    self?.spellsClassesLabel.text = String(details.classes)
                    self?.spellsSchoolLabel.text = String(details.school)
                    self?.spellsLevelLabel.text = String(details.level)
                    self?.spellsRangeLabel.text = String(details.range)
                    self?.spellsComponentsLabel.text = details.components
                    self?.spellsMaterialLabel.text = details.material
                    self?.spellsCastingTimeLabel.text = String(details.casting_time)
                    self?.spellsDurationLabel.text = String(details.duration)
                    self?.spellsConcentrationLabel.text = String(details.concentraion)
                    self?.spellsAttackTypeLabel.text = String(details.attack_type)
                    self?.spellsDamageLabel.text = String(details.damage)
                    self?.spellsRitualLabel.text = String(details.ritual)
                    self?.spellsHigherLevelLabel.text = String(details.higher_level)
                case.failure(let error):
                    print(error)
                default: break
                }
            }
        }
    }
}
