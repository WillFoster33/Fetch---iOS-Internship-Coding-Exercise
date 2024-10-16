//
//  ItemListViewModel.swift
//  Fetch Coding Exercise
//
//  Created by Will Foster on 10/15/24.
//

import Foundation
import Combine

class ItemListViewModel: ObservableObject {
    @Published var groupedItems: [Int: [Item]] = [:]
    
    private var networkManager = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchAndProcessItems()
    }
    
    func fetchAndProcessItems() {
        networkManager.fetchItems { [weak self] items in
            DispatchQueue.main.async {
                let filteredItems = items.filter { $0.name?.isEmpty == false }
                let sortedItems = filteredItems.sorted {
                    if $0.listId != $1.listId {
                        return $0.listId < $1.listId
                    } else {
                        return $0.name ?? "" < $1.name ?? ""
                    }
                }
                self?.groupedItems = Dictionary(grouping: sortedItems, by: { $0.listId })
            }
        }
    }
}
