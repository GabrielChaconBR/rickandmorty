//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Gabriel Chacon on 10/08/23.
//

import UIKit
import UI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let nav = NavigationController()
        let splashViewController = makeSplashController(nav: nav)
        nav.setRootViewController(splashViewController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}

