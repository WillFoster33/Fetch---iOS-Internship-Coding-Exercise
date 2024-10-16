//
//  ItemRow.swift
//  Fetch Coding Exercise
//
//  Created by Will Foster on 10/15/24.
//

import SwiftUI

import SwiftUI

struct ItemRow: View {
    let item: Item
    
    var body: some View {
        Text(item.name ?? "Unnamed Item")
            .padding()
    }
}

