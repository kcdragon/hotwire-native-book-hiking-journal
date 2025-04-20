//
//  MapView.swift
//  HikingJournal
//
//  Created by Mike Dalton on 4/19/25.
//

import MapKit
import SwiftUI

struct MapView: View {
    var viewModel: HikeViewModel

    var body: some View {
        Map {
            if let hike = viewModel.hike {
                Marker(hike.name, coordinate: hike.coordinate)
            }
        }
        .mapStyle(.hybrid(elevation: .realistic))
        .navigationTitle("Map")
        .clipped()
        .task {
            await viewModel.fetchCoordinates()
        }
    }
}

#Preview {
    let url = URL(string: "https://example.com")!
    let viewModel = HikeViewModel(url: url)
    viewModel.hike = Hike(
        name: "Mount Tabor",
        latitude: 45.511881,
        longitude: -122.595706
    )
    return MapView(viewModel: viewModel)
}
