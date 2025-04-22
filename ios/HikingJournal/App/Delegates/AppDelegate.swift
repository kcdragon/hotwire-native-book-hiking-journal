//
//  AppDelegate.swift
//  HikingJournal
//
//  Created by Mike Dalton on 4/2/25.
//

import HotwireNative
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        Hotwire.loadPathConfiguration(from: [
            .server(baseUrl.appending(path: "configurations/ios_v1.json"))
        ])
        Hotwire.registerBridgeComponents([
            ButtonComponent.self
        ])
        return true
    }
}
