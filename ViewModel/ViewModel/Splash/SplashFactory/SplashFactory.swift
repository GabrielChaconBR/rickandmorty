//
//  SplashFactory.swift
//  ViewModel
//
//  Created by Gabriel Chacon on 14/08/23.
//

import Foundation
import Domain
import UI

class SplashFactory {
    
    public func makeAlert(_ data: AlertViewModel) -> AlertViewEntity {
        return AlertViewEntity(title: data.title, message: data.message)
    }
}

