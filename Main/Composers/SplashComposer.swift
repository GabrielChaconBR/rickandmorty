//
//  SplashComposer.swift
//  Main
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation
import UI
import ViewModel
import Domain

public final class SplashComposer {
    
    public static func composeControllerWith(getRickAndMorty: GetRickAndMortyProtocol) -> SplashViewController {
        
        let controller = SplashViewController()
        let viewModel = RickAndMortyViewModel(alertView: WeakVarProxy(controller), getRickAndMorty: getRickAndMorty)
        controller.rickAndMorty = viewModel.rickAndMorty
        return controller
    }
}
