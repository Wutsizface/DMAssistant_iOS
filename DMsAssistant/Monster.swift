//
//  Monster.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 6/17/21.
//

import Foundation

struct MonsterIndex: Codable {
    let name: String
    let size: String
    let type: String
    let subtype: String
    let alignment: String
    let armor_class: Int
    let hit_points: Int
    let hit_dice: String
    let forms: String
    let speed: String
    let strength: Int
    let dexterity: Int
    let constitution: Int
    let intelligence: Int
    let wisdom: Int
    let charisma: Int
//    let proficiencies: List
//    let damage_vulnerabilities: List
//    let damage_resistances: List
//    let damage_immunities: List
//    let condition_immunities: List
//    let senses: Object
//    let languages: String
//    let challenge_rating: Int
//    let special_abilities: List
//    let actions: List
//    let legendary_actions: List
}

struct MonsterResults: Codable {
    let results: [MonsterIndex]
}
