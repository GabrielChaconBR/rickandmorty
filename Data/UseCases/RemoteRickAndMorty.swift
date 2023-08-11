//
//  RemoteRickAndMorty.swift
//  Data
//
//  Created by Gabriel Chacon on 11/08/23.
//

import Foundation
import Domain

public final class RemoteRickAndMorty {
    
    private let url: URL
    private let httpClient: HttpGetClientProtocol
    
    public init(url: URL, httpClient: HttpGetClientProtocol) {
        self.url = url
        self.httpClient = httpClient
    }
    
    public func getRickAndMorty() {
        httpClient.get(to: url)
    }
}
