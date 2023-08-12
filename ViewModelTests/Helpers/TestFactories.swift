//
//  TestFactories.swift
//  ViewModelTests
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation
import ViewModel

func makeErrorAlertViewModel(message: String) -> AlertViewModel {
    AlertViewModel(title: "Erro", message: message)
}
