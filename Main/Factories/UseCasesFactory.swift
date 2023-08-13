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
    
    static func makeRemoteRickAndMorty() -> RemoteRickAndMorty {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://rickandmortyapi.com/api/")!
        return RemoteRickAndMorty(url: url, httpClient: alamofireAdapter)
    }
}
