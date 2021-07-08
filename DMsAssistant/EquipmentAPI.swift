//
//  EquipmentAPI.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 7/8/21.
//

import Foundation

struct EquipmentAPI {
    
    enum EquipmentErrors: Error, LocalizedError {
        case badURL
        case requestError
        case decodeError
    }
    
    static func fetchAllEquipment(completion: @escaping ((Result<[EquipmentIndex], Error>?) -> Void)) {
        guard let url = URL(string: "https://www.dnd5eapi.co/api/equipment") else {
            completion(.failure(EquipmentErrors.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard error == nil, let data = data else {
                completion(.failure(EquipmentErrors.requestError))
                return
            }
            
            if let decodedEquipment = try? JSONDecoder().decode(EquipmentResults.self, from: data) {
                completion(.success((decodedEquipment.results)))
            } else {
                completion(.failure(EquipmentErrors.decodeError))
            }
        }
        
        task.resume()
    }
    
    static func fetchEquipmentDetails(index: String, completion: @escaping ((Result<EquipmentDetails, Error>?) -> Void)) {
        guard let url = URL(string: "https://www.dnd5eapi.co/api/equipment/\(index)") else {
            completion(.failure(EquipmentErrors.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard error == nil, let data = data else {
                completion(.failure(EquipmentErrors.requestError))
                return
            }
            
            if let decodedEquipmentDetails = try? JSONDecoder().decode(EquipmentDetails.self, from: data) {
                completion(.success((decodedEquipmentDetails)))
            } else {
                completion(.failure(EquipmentErrors.decodeError))
            }
        }
        
        task.resume()
    }
}
