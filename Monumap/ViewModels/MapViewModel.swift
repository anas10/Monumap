//
//  MapViewModel.swift
//  Monumap
//
//  Created by Anas Ait Ali on 28/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
import RxSwift

protocol MapViewModelType {
    init(provider: Networking, dataManager: DataManager)
}

class MapViewModel: MapViewModelType {
    let provider: Networking
    let dataManager: DataManager

    required init(provider: Networking, dataManager: DataManager) {
        self.provider = provider
        self.dataManager = dataManager
    }
}
