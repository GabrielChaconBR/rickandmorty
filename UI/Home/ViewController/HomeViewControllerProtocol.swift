//
//  HomeViewControllerProtocols.swift
//  RickAndMorty
//
//  Created Gabriel Chacon on 13/08/23.
//

import Foundation
import Domain

public protocol HomeViewControllerProtocol: AnyObject {
    var contentView: HomeViewProtocol? { get }
    func updateView(with viewState: HomeViewState)
}

public protocol HomeViewModelProtocol: AnyObject {
    func viewState(state: HomeViewState)
}
