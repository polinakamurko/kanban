//
//  Item.swift
//  KanbanBoard
//
//  Created by Полина Истомина on 27.07.2021.
//

struct Item {
    let title: String
}

extension Item {
    static func generateMockItems() -> [Item] {
        let random = Int.random(in: 3..<8)
        let items = (0..<random).map { Item(title: "Item \($0)") }
        return items
    }
}
