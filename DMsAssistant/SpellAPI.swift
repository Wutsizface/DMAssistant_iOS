//
//  SpellAPI.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 7/8/21.
//

import Foundation

struct SpellAPI {
    
    enum SpellErrors: Error, LocalizedError {
        case badURL
        case requestError
        case decodeError
    }
    
    static func fetchAllSpells(completion: @escaping ((Result<[SpellIndex], Error>?) -> Void)) {
        guard let url = URL(string: "https://www.dnd5eapi.co/api/spells") else {
            completion(.failure(SpellErrors.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard error == nil, let data = data else {
                completion(.failure(SpellErrors.requestError))
                return
            }
            
            if let decodedSpell = try? JSONDecoder().decode(SpellResults.self, from: data) {
                completion(.success((decodedSpell.results)))
            } else {
                completion(.failure(SpellErrors.decodeError))
            }
        }
        
        task.resume()
    }
    
    static func fetchSpellsDetails(index: String, completion: @escaping ((Result<SpellIndex, Error>?) -> Void)) {
        guard let url = URL(string: "https://www.dnd5eapi.co/api/spells/\(index)") else {
            completion(.failure(SpellErrors.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard error == nil, let data = data else {
                completion(.failure(SpellErrors.requestError))
                return
            }
            
            if let decodedSpellsDetails = try? JSONDecoder().decode(SpellIndex.self, from: data) {
                completion(.success((decodedSpellsDetails)))
            } else {
                completion(.failure(SpellErrors.decodeError))
            }
        }
        
        task.resume()
    }
}
