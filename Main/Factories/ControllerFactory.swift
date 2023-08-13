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
    
    public static func makeSplash(getRickAndMorty: GetRickAndMortyProtocol) -> SplashViewController {
        let controller = SplashViewController()
        let viewModel = RickAndMortyViewModel(alertView: WeakVarProxy(controller), getRickAndMorty: getRickAndMorty)
        controller.rickAndMorty = viewModel.rickAndMorty
        return controller
    }
}

class WeakVarProxy<T: AnyObject> {
    private weak var instance: T?
    
    init(_ instance: T) {
        self.instance = instance
    }
}

extension WeakVarProxy: AlertView where T: AlertView {
    func showMessage(alertViewModel: ViewModel.AlertViewModel) {
        instance?.showMessage(alertViewModel: alertViewModel)
    }
}
