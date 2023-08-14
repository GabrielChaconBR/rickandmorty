//
//  UIDataSourceDelegate.swift
//  UI
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation

protocol UIDataSourceDelegate: AnyObject {
    associatedtype ItemType
    func numberOfItems() -> Int
    func item(at index: Int) -> ItemType?
}
