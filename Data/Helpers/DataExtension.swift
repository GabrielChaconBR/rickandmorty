//
//  DataExtension.swift
//  Data
//
//  Created by Gabriel Chacon on 11/08/23.
//

import Foundation

public extension Data {
    func toModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
