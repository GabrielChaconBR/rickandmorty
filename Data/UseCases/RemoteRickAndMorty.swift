//
//  RemoteRickAndMorty.swift
//  Data
//
//  Created by Gabriel Chacon on 11/08/23.
//

import Foundation
import Domain

public final class RemoteRickAndMorty: GetRickAndMortyProtocol {
    
    private let url: URL
    private let httpClient: HttpGetClientProtocol
    
    public init(url: URL, httpClient: HttpGetClientProtocol) {
        self.url = url
        self.httpClient = httpClient
    }
    
    public func getRickAndMorty(completion: @escaping (Result<RickAndMortyModel, DomainError>) -> Void) {
        httpClient.get(to: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
                case .success(let data):
                if let model: RickAndMortyModel = data.toModel() {
                    completion(.success(model))
                } else {
                    completion(.failure(.unexpected))
                }
            case .failure:
                completion(.failure(.unexpected))
            }
        }
    }
}
