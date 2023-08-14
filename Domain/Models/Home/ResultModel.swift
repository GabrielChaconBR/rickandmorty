//
//  ResultModel.swift
//  Domain
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation

public struct ResultModel: Model {

    public let image: String
    public let name: String
    
    public init(image: String, name: String) {
        self.image = image
        self.name = name
    }
}
