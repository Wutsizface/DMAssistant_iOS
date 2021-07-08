//
//  APIController.swift
//  DMsAssistant
//
//  Created by Jacob Russell on 6/17/21.
//

import Foundation

struct MonsterAPI {
    enum MonsterErrors: Error, LocalizedError {
        case badURL
        case requestError
        case decodeError
    }
    
    static func fetchAllMonsters(completion: @escaping ((Result<[MonsterIndex], Error>) -> Void)) {
        guard let url = URL(string: "https://www.dnd5eapi.co/api/monsters") else {
            completion(.failure(MonsterErrors.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard error == nil, let data = data else {
                completion(.failure(MonsterErrors.requestError))
                return
            }
            
            if let decodedMonster = try? JSONDecoder().decode(MonsterResults.self, from: data) {
                completion(.success((decodedMonster.results)))
            } else {
                completion(.failure(MonsterErrors.decodeError))
            }
        }
        
        task.resume()
    }
    static func fetchMonsterDetails(index: String, completion: @escaping ((Result<MonsterIndex, Error>?) -> Void)) {
        guard let url = URL(string: "https://www.dnd5eapi.co/api/monsters/\(index)") else {
            completion(.failure(MonsterErrors.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard error == nil, let data = data else {
                completion(.failure(MonsterErrors.requestError))
                return
            }
            
            if let decodedMonsterDetails = try? JSONDecoder().decode(MonsterIndex.self, from: data) {
                completion(.success((decodedMonsterDetails)))
            } else {
                completion(.failure(MonsterErrors.decodeError))
            }
        }
        
        task.resume()
    }
}


