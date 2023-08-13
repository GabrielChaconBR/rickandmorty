//
//  ControllerFactory.swift
//  Main
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation
import UI
import ViewModel
import Domain


class ControllerFactory {
    
    static func makeSplash(getRickAndMorty: GetRickAndMortyProtocol) -> SplashViewController {
        let controller = SplashViewController()
        let viewModel = RickAndMortyViewModel(alertView: controller, getRickAndMorty: getRickAndMorty)
        controller.rickAndMorty = viewModel.rickAndMorty
        return controller
    }
}
