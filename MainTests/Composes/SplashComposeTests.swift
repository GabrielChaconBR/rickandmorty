//
//  SplashComposeTests.swift
//  MainTests
//
//  Created by Gabriel Chacon on 13/08/23.
//

import XCTest
import Main
import UI

final class SplashComposeTests: XCTestCase {

    func test_background_request_should_complete_on_main_thread()  {
        let (sut, getRickAndMortySpy) = makeSut()
        sut.loadViewIfNeeded()
        sut.rickAndMorty?()
        
        let exp = expectation(description: "waiting")
        DispatchQueue.global().async {
            getRickAndMortySpy.completeWithError(.unexpected)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}

extension SplashComposeTests {
    
    func makeSut(file: StaticString = #file, line: UInt = #line) -> (sut: SplashViewController, getRickAndMortySpy: GetRickAndMortySpy) {
        
        let getRickAndMortySpy = GetRickAndMortySpy()
        let sut = SplashComposer.composeControllerWith(getRickAndMorty: getRickAndMortySpy)
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: getRickAndMortySpy, file: file, line: line)
        return (sut, getRickAndMortySpy)
    }
}
