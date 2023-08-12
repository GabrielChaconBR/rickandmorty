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
    
    func test_splash_should_show_error_message_if_get_fails() {
        let alertViewSpy = AlertViewSpy()
        let getRickAndMortySpy = GetRickAndMortySpy()
        let sut = makeSut(alertView: alertViewSpy, getRickAndMortySpy: getRickAndMortySpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { alertView in
            XCTAssertEqual(alertView, makeErrorAlertViewModel(message: "Algo inesperado aconteceu, tente novamente."))
            exp.fulfill()
        }
        sut.rickAndMorty()
        getRickAndMortySpy.completeWithError(.unexpected)
        wait(for: [exp], timeout: 1)
    }
}

extension RickAndMortyViewModelTests {
    
    func makeSut(alertView: AlertViewSpy = AlertViewSpy(), getRickAndMortySpy: GetRickAndMortySpy = GetRickAndMortySpy(), file: StaticString = #file, line: UInt = #line) -> RickAndMortyViewModel {
        let sut = RickAndMortyViewModel(alertView: alertView, getRickAndMorty: getRickAndMortySpy)
        
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
