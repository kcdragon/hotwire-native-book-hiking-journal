//
//  HikeViewModel.swift
//  HikingJournal
//
//  Created by Mike Dalton on 4/19/25.
//

import Foundation

@Observable class HikeViewModel {
    var hike: Hike?
    
    private let url: URL
    
    init(url: URL) {
        self.url = url.appendingPathExtension("json")
    }
    
    func fetchCoordinates() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            hike = try JSONDecoder().decode(Hike.self, from: data)
        } catch {
            print("Failed to fetch hike: \(error.localizedDescription)")
        }
    }
}
