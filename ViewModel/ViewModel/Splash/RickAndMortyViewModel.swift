//
//  RickAndMortyViewModel.swift
//  ViewModel
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation
import Domain
import UI

public final class RickAndMortyViewModel {
    
    private let getRickAndMorty: GetRickAndMortyProtocol
    private let delegate: SplashViewModelProtocol
    
    public init(delegate: SplashViewModelProtocol, getRickAndMorty: GetRickAndMortyProtocol) {
        self.delegate = delegate
        self.getRickAndMorty = getRickAndMorty
    }
    
    public func rickAndMorty() {
        getRickAndMorty.getRickAndMorty { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                switch result {
                case .failure:
                    self.failure()
                case .success(let data):
                    self.success(data)
                }
            }
        }
    }
    
    private func success(_ data: RickAndMortyModel) {
        Thread.sleep(forTimeInterval: 3.0)
        let entity = data.characters
        self.delegate.viewState(state: .hasData(entity))
    }
    
    private func failure() {
        let alert = SplashFactory().makeAlert(AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente.")) // Em app real strings não deveriam estar hardcode
        self.delegate.viewState(state: .hasError(alert))
    }
}
