//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Gabriel Chacon on 10/08/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = SplashFactory.makeController()
        window?.makeKeyAndVisible()
    }
}

