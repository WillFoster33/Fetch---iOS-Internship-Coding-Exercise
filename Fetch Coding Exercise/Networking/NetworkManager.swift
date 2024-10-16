//
//  NetworkManager.swift
//  Fetch Coding Exercise
//
//  Created by Will Foster on 10/15/24.
//

import Foundation

class NetworkManager {
    func fetchItems(completion: @escaping ([Item]) -> Void) {
        guard let url = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json") else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let items = try? JSONDecoder().decode([Item].self, from: data) else {
                completion([])
                return
            }
            completion(items)
        }.resume()
    }
}
