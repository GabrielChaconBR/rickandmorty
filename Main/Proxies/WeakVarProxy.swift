//
//  WeakVarProxy.swift
//  Main
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation
import ViewModel

final class WeakVarProxy<T: AnyObject> {
    private weak var instance: T?
    
    init(_ instance: T) {
        self.instance = instance
    }
}

extension WeakVarProxy: AlertView where T: AlertView {
    func showMessage(alertViewModel: ViewModel.AlertViewModel) {
        instance?.showMessage(alertViewModel: alertViewModel)
    }
}
