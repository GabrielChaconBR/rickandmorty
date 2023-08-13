//
//  SplashIntegrationTests.swift
//  MainTests
//
//  Created by Gabriel Chacon on 13/08/23.
//

import XCTest
import Main

final class SplashIntegrationTests: XCTestCase {

    func test_ui_viewModel_integration()  {
        let sut = SplashComposer.composeControllerWith(getRickAndMorty: GetRickAndMortySpy())
        checkMemoryLeak(for: sut)
    }
}
