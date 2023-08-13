//
//  SplashViewProtocol.swift
//  RickAndMorty
//
//  Created Gabriel Chacon on 12/08/23.
//

import UIKit

public protocol SplashViewProtocol: AnyObject {
    var content: UIView { get }
}

public protocol SplashViewDelegate: AnyObject {
    
}

extension SplashViewProtocol where Self: UIView {
    public var content: UIView { return self }
}
