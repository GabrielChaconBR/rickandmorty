//
//  SplashFactory.swift
//  Main
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation
import UI
import Infra
import Data
import ViewModel

class SplashFactory {
    
    static func makeController() -> SplashViewController {
        let controller = SplashViewController()
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://rickandmortyapi.com/api/")!
        let remoteGetRickAndMorty = RemoteRickAndMorty(url: url, httpClient: alamofireAdapter)
        let viewModel = RickAndMortyViewModel(alertView: controller, getRickAndMorty: remoteGetRickAndMorty)
        controller.rickAndMorty = viewModel.rickAndMorty
        return controller
    }
}
