//
//  MapController.swift
//  HikingJournal
//
//  Created by Mike Dalton on 4/19/25.
//

import SwiftUI
import UIKit

class MapController: UIHostingController<MapView> {
    convenience init(url: URL) {
        let viewModel = HikeViewModel(url: url)
        let view = MapView(viewModel: viewModel)
        self.init(rootView: view)
    }
}
