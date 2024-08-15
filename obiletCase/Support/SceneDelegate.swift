//
//  SceneDelegate.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let homeViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        
        window.rootViewController = navigationController
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}
