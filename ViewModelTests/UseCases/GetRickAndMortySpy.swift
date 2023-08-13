//
//  GetRickAndMortySpy.swift
//  ViewModelTests
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation
import Domain

class GetRickAndMortySpy: GetRickAndMortyProtocol {
    
    var completion: ((Result<RickAndMortyModel, DomainError>) -> Void)?
    func getRickAndMorty(completion: @escaping (Result<RickAndMortyModel, DomainError>) -> Void) {
        
        self.completion = completion
    }
    
    func completeWithData(_ data: RickAndMortyModel) {
        completion?(.success(data))
    }
    
    func completeWithError(_ error: DomainError) {
        completion?(.failure(error))
    }
}
