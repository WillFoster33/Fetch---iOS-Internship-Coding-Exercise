//
//  ContentView.swift
//  Fetch Coding Exercise
//
//  Created by Will Foster on 10/15/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ItemListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.groupedItems.keys.sorted(), id: \.self) { listId in
                    Section(header: Text("List \(listId)")) {
                        ForEach(viewModel.groupedItems[listId] ?? []) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Fetch Coding Exercise")
        }
    }
}
