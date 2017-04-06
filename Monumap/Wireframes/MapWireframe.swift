//
//  MapWireframe.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

typealias MapViewModelConstructorType = (MapViewController) -> (MapViewModel)

protocol MapWireframeType {
    var storyboard : UIStoryboard! { get }
    var provider: Networking { get }

    init(storyboard: UIStoryboard, provider: Networking)

    func instantiateInitialViewController(dataManager: DataManager) -> MapViewController
}

class MapWireframe: MapWireframeType {
    let storyboard: UIStoryboard!
    let provider: Networking

    required init(storyboard: UIStoryboard = UIStoryboard.main(), provider: Networking) {
        self.storyboard = storyboard
        self.provider = provider
    }

    func instantiateInitialViewController(dataManager: DataManager) -> MapViewController {
        let vc = self.storyboard.viewControllerWithID(.mapViewControllerID) as! MapViewController
        vc.viewModelConstructor = { _ in
            MapViewModel(provider: self.provider, dataManager: dataManager)
        }
        return vc
    }
}

