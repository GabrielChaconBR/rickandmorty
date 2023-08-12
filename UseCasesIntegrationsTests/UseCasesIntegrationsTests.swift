//
//  UseCasesIntegrationsTests.swift
//  UseCasesIntegrationsTests
//
//  Created by Gabriel Chacon on 12/08/23.
//

import XCTest
import Domain
import Data
import Infra

final class UseCasesIntegrationsTests: XCTestCase {

    func test_get_rick_and_morty() {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://rickandmortyapi.com/api/")!
        let sut = RemoteRickAndMorty(url: url, httpClient: alamofireAdapter)
        let exp = expectation(description: "waiting")
        sut.getRickAndMorty { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data.characters)
            case .failure:
                XCTFail("Expect success got \(result) instead")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
}
