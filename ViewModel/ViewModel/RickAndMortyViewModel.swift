//
//  RickAndMortyViewModel.swift
//  ViewModel
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation
import Domain

public final class RickAndMortyViewModel {
    
    private let alertView: AlertView
    private let getRickAndMorty: GetRickAndMortyProtocol
    
    public init(alertView: AlertView, getRickAndMorty: GetRickAndMortyProtocol) {
        self.alertView = alertView
        self.getRickAndMorty = getRickAndMorty
    }
    
    public func rickAndMorty() {
        getRickAndMorty.getRickAndMorty { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure:
                self.alertView.showMessage(alertViewModel: AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente."))
            case .success: break
            }
        }
    }
}
