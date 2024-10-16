//
//  Items.swift
//  Fetch Coding Exercise
//
//  Created by Will Foster on 10/15/24.
//

import Foundation

struct Item: Codable, Identifiable {
    let id: Int
    let listId: Int
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id, listId, name
    }
}
