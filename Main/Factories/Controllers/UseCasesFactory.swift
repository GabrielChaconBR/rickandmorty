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
    
    private static func makeUrl(path: String) -> URL {
        URL(string: path)!
    }
    
    public static func makeRemoteRickAndMorty() -> RemoteRickAndMorty {
        RemoteRickAndMorty(url: makeUrl(path: apiBaseUrl), httpClient: httpClient)
    }
    
    public static func makeRemoteListRickAndMorty(path: String) -> RemoteListRickAndMorty {
        RemoteListRickAndMorty(url: makeUrl(path: path), httpClient: httpClient)
    }
}
