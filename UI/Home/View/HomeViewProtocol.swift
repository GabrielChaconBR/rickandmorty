//
//  HomeViewProtocol.swift
//  RickAndMorty
//
//  Created Gabriel Chacon on 13/08/23.
//

import UIKit

public protocol HomeViewProtocol: AnyObject {
    var content: UIView { get }
    func updateView(with viewState: HomeViewState)
}

extension HomeViewProtocol where Self: UIView {
    public var content: UIView { return self }
}
