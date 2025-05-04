//
//  NotificationTokenComponent.swift
//  HikingJournal
//
//  Created by Mike Dalton on 5/3/25.
//

import HotwireNative
import UIKit

class NotificationTokenComponent: BridgeComponent {
    override class var name: String { "notification-token" }
    
    override func onReceive(message: Message) {
        Task { await requestNotificationPermission() }
    }
    
    private func requestNotificationPermission() async {    
        do { 
            let center = UNUserNotificationCenter.current()
            let options: UNAuthorizationOptions = [.alert, .badge, .sound]
            if try await center.requestAuthorization(options: options) {
                UIApplication.shared.registerForRemoteNotifications()
            }
        } catch {
            print("Failed to authorize: \(error.localizedDescription)")
        }
    }
}
