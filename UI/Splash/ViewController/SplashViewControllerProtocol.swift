//
//  SplashViewControllerProtocol.swift
//  UI
//
//  Created by Gabriel Chacon on 12/08/23.
//

import Foundation

public protocol SplashViewControllerProtocol: AnyObject {
    var contentView: SplashViewProtocol? { get }
    func updateView(with viewState: SplashViewState)
}
