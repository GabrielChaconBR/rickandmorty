//
//  SplashRouter.swift
//  UI
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation

public final class SplashRouter {
    private let nav: NavigationController
    private let homeFactory: (String) -> HomeViewController
    
    public init(nav: NavigationController, homeFactory: @escaping (String) -> HomeViewController) {
        self.nav = nav
        self.homeFactory = homeFactory
    }
    
    public func goToHome(data: String) {
        nav.pushViewController(homeFactory(data))
    }
}
