//
//  NotificationRouter.swift
//  HikingJournal
//
//  Created by Mike Dalton on 5/4/25.
//

import HotwireNative
import UserNotifications

class NotificationRouter: NSObject, UNUserNotificationCenterDelegate {
    private unowned let router: Router
    
    init(router: Router) {
        self.router = router
    }

    @MainActor
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) async {
        let userInfo = response.notification.request.content.userInfo
        if let path = userInfo["path"] as? String {
            let url = baseUrl.appending(path: path)
            router.route(url)
        }
    }
}
