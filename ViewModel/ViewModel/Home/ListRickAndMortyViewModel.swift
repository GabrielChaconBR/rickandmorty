//
//  ListRickAndMortyViewModel.swift
//  ViewModel
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation
import Domain
import UI

public final class ListRickAndMortyViewModel {
    
    private let delegate: HomeViewModelProtocol
    private let getListRickAndMorty: GetListRickAndMortyProtocol
    
    public init(delegate: HomeViewModelProtocol, getListRickAndMorty: GetListRickAndMortyProtocol) {
        self.delegate = delegate
        self.getListRickAndMorty = getListRickAndMorty
    }
    
    public func listRickAndMorty() {
        getListRickAndMorty.getListRickAndMorty { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure:
                self.failure()
            case .success(let data):
                self.success(data)
            }
        }
    }
    
    private func success(_ data: WelcomeModel) {
        let entity = HomeFactory().make(data)
        self.delegate.viewState(state: .hasData(entity))
    }
    
    private func failure() {
        let alert = HomeFactory().makeAlert(AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente.")) // Em app real strings não deveriam estar hardcode
        self.delegate.viewState(state: .hasError(alert))
    }
}
