//
//  AlertViewSpy.swift
//  ViewModelTests
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation
import ViewModel

class AlertViewSpy: AlertView {
    var alertView: AlertViewModel?
    var emit: ((AlertViewModel) -> Void)?
    
    func observe(completion: @escaping (AlertViewModel) -> Void) {
        self.emit = completion
    }
    
    func showMessage(alertViewModel: AlertViewModel) {
        self.emit?(alertViewModel)
    }
}
