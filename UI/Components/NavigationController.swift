//
//  NavigationController.swift
//  UI
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation
import UIKit

public final class NavigationController: UINavigationController {
    
    public func setRootViewController(_ viewController: UIViewController) {
        setViewControllers([viewController], animated: true)
    }
    
    public func pushViewController(_ viewController: UIViewController) {
        pushViewController(viewController, animated: true)
    }
}
