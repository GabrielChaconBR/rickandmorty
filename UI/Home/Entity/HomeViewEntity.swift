//
//  HomeViewEntity.swift
//  RickAndMorty
//
//  Created Gabriel Chacon on 13/08/23.
//

import Foundation
import UIKit

public struct HomeViewEntity {
    public init(items: [ItemViewEntity]) {
        self.items = items
    }
    
    let items: [ItemViewEntity]
}

public struct ItemViewEntity {
    public init(image: URL?, name: String) {
        self.image = image
        self.name = name
    }
    
    let image: URL?
    let name: String
}

public struct AlertViewEntity {
    public init(title: String, message: String) {
        self.title = title
        self.message = message
    }
    
    public var title: String
    public var message: String
}
