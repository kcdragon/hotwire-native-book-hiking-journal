//
//  SceneDelegate.swift
//  HikingJournal
//
//  Created by Mike Dalton on 4/2/25.
//

import HotwireNative
import UIKit

let baseUrl = URL(string: "http://localhost:3000")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate { 
    var window: UIWindow?
    
    private let tabBarController = TabBarController()
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        window?.rootViewController = tabBarController
    }
}
