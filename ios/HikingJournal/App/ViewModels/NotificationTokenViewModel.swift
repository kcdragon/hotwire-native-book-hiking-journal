//
//  NotificationTokenViewModel.swift
//  HikingJournal
//
//  Created by Mike Dalton on 5/3/25.
//

import Foundation

class NotificationTokenViewModel {
    func register(_ token: String) async {
        let url = baseUrl.appending(path: "notification_tokens")

        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Accept")
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let body = NotificationToken(token: token)
            req.httpBody = try JSONEncoder().encode(body)
            
            _ = try? await URLSession.shared.data(for: req)
        } catch {
            print("Failed to POST token: \(error.localizedDescription)")
            return
        }
    
    }
}
