//
//  ListRickAndMortyViewModel.swift
//  ViewModel
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation
import Domain

public final class ListRickAndMortyViewModel {
    
    private let alertView: AlertView
    private let getListRickAndMorty: GetListRickAndMortyProtocol
    
    public init(alertView: AlertView, getListRickAndMorty: GetListRickAndMortyProtocol) {
        self.alertView = alertView
        self.getListRickAndMorty = getListRickAndMorty
    }
    
    public func listRickAndMorty() {
        getListRickAndMorty.getListRickAndMorty { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure:
                self.alertView.showMessage(alertViewModel: AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente."))
            case .success:
                self.alertView.showMessage(alertViewModel: AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente."))
            }
        }
    }
    
    private func success(data: WelcomeModel) {
        
    }
}
