//
//  AlertView.swift
//  ViewModel
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation

public protocol AlertView {
    func showMessage(alertViewModel: AlertViewModel)
}

public struct AlertViewModel: Equatable {
    
    public var title: String
    public var message: String
    
    public init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}
