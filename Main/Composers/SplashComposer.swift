//
//  SplashComposer.swift
//  Main
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation
import Domain
import UI

public final class SplashComposer {
    
    public static func composeControllerWith(remoteRickAndMorty: GetRickAndMortyProtocol ) -> SplashViewController {
        ControllerFactory.makeSplash(getRickAndMorty: remoteRickAndMorty)
    }
}
