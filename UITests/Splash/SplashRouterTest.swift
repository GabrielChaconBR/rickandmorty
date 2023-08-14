//
//  SplashRouterTests.swift
//  UITests
//
//  Created by Gabriel Chacon on 13/08/23.
//

import XCTest
import UIKit
import ViewModel
@testable import UI

class SplashRouterTests: XCTestCase {
    
    func test_goToHome_calls_nav_with_correct_vc() {
        let (sut, nav) = makeSut(data: "")
        sut.goToHome(data: <#String#>)
        XCTAssertEqual(nav.viewControllers.count, 1)
        XCTAssertTrue(nav.viewControllers[0] is HomeViewController)
    }
}

extension SplashRouterTests {
    func makeSut(data: String) -> (sut: SplashRouter, nav: NavigationController) {
        let homeFactorySpy = HomeFactorySpy()
        let nav = NavigationController()
        let sut = SplashRouter(nav: nav, homeFactory: homeFactorySpy.makeHome(data))
        return (sut, nav)
    }
}

extension SplashRouterTests {
    class HomeFactorySpy {
        func makeHome() -> HomeViewController {
            return HomeViewController()
        }
    }
}

