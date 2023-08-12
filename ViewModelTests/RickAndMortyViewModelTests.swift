//
//  RickAndMortyViewModelTests.swift
//  RickAndMortyViewModelTests
//
//  Created by Gabriel Chacon on 12/08/23.
//

import XCTest
import Domain
import ViewModel

class RickAndMortyViewModelTests: XCTestCase {

    func test_splash_should_call_get() {
        let sut = makeSut()
        sut.rickAndMorty()
        
    }

}

extension RickAndMortyViewModelTests {
    
    func makeSut(getRickAndMortySpy: GetRickAndMortySpy = GetRickAndMortySpy()) -> RickAndMortyViewModel {
        let sut = RickAndMortyViewModel(getRickAndMorty: getRickAndMortySpy)
        return sut
    }
}

class GetRickAndMortySpy: GetRickAndMortyProtocol {
    
    func getRickAndMorty(completion: @escaping (Result<Domain.RickAndMortyModel, Domain.DomainError>) -> Void) {
        
    }
}
