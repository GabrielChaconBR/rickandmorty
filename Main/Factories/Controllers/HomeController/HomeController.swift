//
//  HomeController.swift
//  Main
//
//  Created by Gabriel Chacon on 14/08/23.
//

import Foundation
import UI
import ViewModel
import Domain

public func makeHomeController(data: String) -> HomeViewController {
    let controller = HomeViewController()
    let viewModel = ListRickAndMortyViewModel(delegate: controller, getListRickAndMorty: UseCasesFactory.makeRemoteListRickAndMorty(path: data))
    controller.listRickAndMorty = viewModel.listRickAndMorty
    return controller
}
