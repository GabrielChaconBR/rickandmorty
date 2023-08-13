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
    private static let apiBaseUrl = "https://rickandmortyapi.com/api"
    
    private static func makeUrl(path: String = "") -> URL {
        URL(string: "\(apiBaseUrl)/\(path)")!
    }
    static func makeRemoteRickAndMorty() -> RemoteRickAndMorty {
        RemoteRickAndMorty(url: makeUrl(), httpClient: httpClient)
    }
}
