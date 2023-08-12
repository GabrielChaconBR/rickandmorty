//
//  GetRickAndMortySpy.swift
//  ViewModelTests
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation
import Domain

class GetRickAndMortySpy: GetRickAndMortyProtocol {
    
    var completion: ((Result<Domain.RickAndMortyModel, Domain.DomainError>) -> Void)?
    func getRickAndMorty(completion: @escaping (Result<Domain.RickAndMortyModel, Domain.DomainError>) -> Void) {
        
        self.completion = completion
    }
    
    func completeWithError(_ error: DomainError) {
        completion?(.failure(error))
    }
}
