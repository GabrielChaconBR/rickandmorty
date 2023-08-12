//
//  RickAndMortyViewModel.swift
//  ViewModel
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation
import Domain

public final class RickAndMortyViewModel {
    
    private let getRickAndMorty: GetRickAndMortyProtocol
    
    public init(getRickAndMorty: GetRickAndMortyProtocol) {
        self.getRickAndMorty = getRickAndMorty
    }
    
    public func rickAndMorty() {
        getRickAndMorty.getRickAndMorty { _ in
            
        }
    }
}
