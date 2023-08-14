//
//  UIDataSource.swift
//  UI
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation

class UIDataSource<ItemType>: UIDataSourceDelegate {
    private var items: [ItemType]

    init(items: [ItemType]) {
        self.items = items
    }

    func numberOfItems() -> Int {
        return items.count
    }

    func item(at index: Int) -> ItemType? {
        guard index >= 0, index < items.count else {
            return nil
        }
        return items[index]
    }

    func addItem(_ item: ItemType) {
        items.append(item)
    }

    func removeItem(at index: Int) {
        guard index >= 0, index < items.count else {
            return
        }
        items.remove(at: index)
    }
    
    func addItems(items: [ItemType]) {
        self.items = items
    }

    func removeAllItems() {
        items.removeAll()
    }
}
