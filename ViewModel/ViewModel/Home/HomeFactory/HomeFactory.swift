//
//  HomeFactory.swift
//  ViewModel
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation
import Domain
import UI

class HomeFactory {
    
    public func make(_ data: WelcomeModel) -> HomeViewEntity {
        return HomeViewEntity(items: makeItems(data: data.results))
    }
    
    private func makeItems(data: [ResultModel]) -> [ItemViewEntity] {
        let items = data.map { item in
            ItemViewEntity(image: URL(string: item.image), name: item.name)
        }
        return items
    }
    
    public func makeAlert(_ data: AlertViewModel) -> AlertViewEntity {
        return AlertViewEntity(title: data.title, message: data.message)
    }
}
