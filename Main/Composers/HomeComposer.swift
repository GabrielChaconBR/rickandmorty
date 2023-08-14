//
//  HomeComposer.swift
//  Main
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation
import UI
import ViewModel
import Domain

public final class HomeComposer {
    
    public static func composeControllerWith(getListRickAndMorty: GetListRickAndMortyProtocol) -> HomeViewController {
        
        let controller = HomeViewController()
        let viewModel = ListRickAndMortyViewModel(alertView: WeakVarProxy(controller), getListRickAndMorty: getListRickAndMorty)
        controller.listRickAndMorty = viewModel.listRickAndMorty
        return controller
    }
}
