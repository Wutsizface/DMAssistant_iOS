//
//  Equipment.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 6/18/21.
//

import Foundation

struct EquipmentIndex: Codable {
    let name: String
    let index: String
}

struct EquipmentResults: Codable {
    let results: [EquipmentIndex]
}

struct EquipmentDetailResults: Codable {
    
}

struct EquipmentDetails: Codable {
    let name: String
    let equipment_category: EquipmentCategory
    let cost: Cost
}

struct EquipmentCategory: Codable {
    let name: String
}

struct Cost: Codable {
    let quantity: Int
    let unit: String
}
