//
//  SplashController.swift
//  Main
//
//  Created by Gabriel Chacon on 14/08/23.
//

import Foundation
import UI
import ViewModel
import Domain

public func makeSplashController(nav: NavigationController) -> SplashViewController {
    let router = SplashRouter(nav: nav, homeFactory: makeHomeController)
    let controller = SplashViewController()
    let viewModel = RickAndMortyViewModel(delegate: controller, getRickAndMorty: UseCasesFactory.makeRemoteRickAndMorty())
    controller.splashRouter = router.goToHome
    controller.rickAndMorty = viewModel.rickAndMorty
    return controller
}
