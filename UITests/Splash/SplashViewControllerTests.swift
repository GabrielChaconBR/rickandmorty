//
//  UITests.swift
//  UITests
//
//  Created by Gabriel Chacon on 12/08/23.
//

import XCTest
import UIKit
import ViewModel
@testable import UI

class SplashViewControllerTests: XCTestCase {
   
    func test_sut_implements_alertView() {
        let sut = makeSut()
        XCTAssertNotNil(sut as AlertView)
    }
}

extension SplashViewControllerTests {
    
    func makeSut() -> SplashViewController {
        let sut = SplashViewController()
        return sut
    }
}
