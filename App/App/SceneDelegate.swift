//
//  SceneDelegate.swift
//  App
//
//  Created by Breno Aquino on 25/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
        
        setupNavigationBarAppearance()
    }
}

// MARK: - Apperacen
extension SceneDelegate {
    private func setupNavigationBarAppearance() {
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
