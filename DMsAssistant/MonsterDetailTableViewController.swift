//
//  MonsterDetailTableViewController.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 7/1/21.
//

import UIKit

class MonsterDetailTableViewController: UITableViewController {
    var monsterDetailIndex: String?
    @IBOutlet weak var monsterNameLabel: UILabel!
    @IBOutlet weak var monsterSizeLabel: UILabel!
    @IBOutlet weak var monsterTypeLabel: UILabel!
    @IBOutlet weak var monsterSubtypeLabel: UILabel!
    @IBOutlet weak var monsterAlignmentLabel: UILabel!
    @IBOutlet weak var monsterACLabel: UILabel!
    @IBOutlet weak var monsterHPLabel: UILabel!
    @IBOutlet weak var monsterHitDiceLabel: UILabel!
    @IBOutlet weak var monsterFormsLabel: UILabel!
    @IBOutlet weak var monsterSpeedLabel: UILabel!
    @IBOutlet weak var monsterStrengthLabel: UILabel!
    @IBOutlet weak var monsterDexterityLabel: UILabel!
    @IBOutlet weak var monsterConstitutionLabel: UILabel!
    @IBOutlet weak var monsterIntelligenceLabel: UILabel!
    @IBOutlet weak var monsterWisdomLabel: UILabel!
    @IBOutlet weak var monsterCharismaLabel: UILabel!
    @IBOutlet weak var monsterProficienciesLabel: UILabel!
    @IBOutlet weak var monsterDamageVulnerabilitiesLabel: UILabel!
    @IBOutlet weak var monsterDamageResistancesLabel: UILabel!
    @IBOutlet weak var monsterDamageImmunitiesLabel: UILabel!
    @IBOutlet weak var monsterConditionImmunitiesLabel: UILabel!
    @IBOutlet weak var monsterSensesLabel: UILabel!
    @IBOutlet weak var monsterLanguagesLabel: UILabel!
    @IBOutlet weak var monsterCRLabel: UILabel!
    @IBOutlet weak var monsterSpecialAbilitiesLabel: UILabel!
    @IBOutlet weak var monsterActionsLabel: UILabel!
    @IBOutlet weak var monsterLegendaryActionsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let monsterDetailIndex = monsterDetailIndex else {
            return
        }
        MonsterAPI.fetchMonsterDetails(index: monsterDetailIndex) {[weak self] (result) in
            DispatchQueue.main.async{
                switch result{
                case.success(let details):
                    self?.monsterNameLabel.text = details.name
                    self?.monsterSizeLabel.text = details.size
                    self?.monsterTypeLabel.text = details.type
                    self?.monsterSubtypeLabel.text = details.subtype
                    self?.monsterAlignmentLabel.text = details.alignment
                    self?.monsterACLabel.text = String(details.armor_class)
                    self?.monsterHPLabel.text = String(details.hit_points)
                    self?.monsterHitDiceLabel.text = details.hit_dice
                    self?.monsterFormsLabel.text = details.forms
                    self?.monsterSpeedLabel.text = details.speed
                    self?.monsterStrengthLabel.text = String(details.strength)
                    self?.monsterDexterityLabel.text = String(details.dexterity)
                    self?.monsterConstitutionLabel.text = String(details.constitution)
                    self?.monsterIntelligenceLabel.text = String(details.intelligence)
                    self?.monsterWisdomLabel.text = String(details.wisdom)
                    self?.monsterCharismaLabel.text = String(details.charisma)
//                    self?.monsterProficienciesLabel.text = details.proficiencies
//                    self?.monsterDamageVulnerabilitiesLabel.text = details.damage_vulnerabilities
//                    self?.monsterDamageResistancesLabel.text = details.damage_resistances
//                    self?.monsterDamageImmunitiesLabel.text = details.damage_immunities
//                    self?.monsterConditionImmunitiesLabel.text = details.condition_immunities
//                    self?.monsterSensesLabel.text = details.senses
//                    self?.monsterLanguagesLabel.text = details.languages
//                    self?.monsterCRLabel.text = details.challenge_rating
//                    self?.monsterSpecialAbilitiesLabel.text = details.special_abilities
//                    self?.monsterActionsLabel.text = details.actions
//                    self?.monsterLegendaryActionsLabel.text = details.legendary_actions
                case.failure(let error):
                    print(error)
                default: break
                }
            }
        }
    }
}
