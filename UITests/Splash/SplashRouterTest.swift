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

public final class SplashRouter {
    private let nav: NavigationController
    
    public init(nav: NavigationController) {
       self.nav = nav
    }
    
    public func goToHome() {
        
    }
}

class SplashRouterTests: XCTestCase {
    
    func test_goToHome_calls_nav_with_correct_vc() {
        let nav = NavigationController()
        //let sut = SplashRouter(nav: nav, homeFactory: HomeFactorySpy)
        //sut.goToHome()
        //XCTAssertTrue(nav.viewControllers[0] is SplashViewController)
    }
}

