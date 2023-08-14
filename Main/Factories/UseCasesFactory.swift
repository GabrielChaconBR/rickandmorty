//
//  UseCasesFactory.swift
//  Main
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation
import Data
import Infra
import Domain

class UseCasesFactory {
    
    private static let httpClient = AlamofireAdapter()
    
    // Faria diferente se fosse um app real
    private static let apiBaseUrl = "https://rickandmortyapi.com/api"
    private static let apiCharacter = "character"
    
    private static func makeUrl(path: String = "") -> URL {
        URL(string: "\(apiBaseUrl)/\(path)")!
    }
    
    static func makeRemoteRickAndMorty() -> RemoteRickAndMorty {
        RemoteRickAndMorty(url: makeUrl(), httpClient: httpClient)
    }
    
    static func makeRemoteListRickAndMorty() -> RemoteListRickAndMorty {
        RemoteListRickAndMorty(url: makeUrl(path: apiCharacter), httpClient: httpClient)
    }
}
