//
//  Spell.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 6/18/21.
//

import Foundation

struct SpellIndex: Codable {
    let desc: String
    let classes: String
    let school: String
    let level: Int
    let range: String
    let components: String
    let material: String
    let casting_time: String
    let duration: String
    let concentraion: Bool
    let attack_type: String
    let damage: String
    let ritual: Bool
    let higher_level: String
}

struct SpellResults: Codable {
    let results: [SpellIndex]
}
