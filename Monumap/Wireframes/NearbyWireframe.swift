//
//  NearbyWireframe.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

typealias NearbyViewModelConstructorType = (NearbyViewController) -> (NearbyViewModel)

protocol NearbyWireframeType {
    var storyboard : UIStoryboard! { get }
    var provider: Networking { get }

    init(storyboard: UIStoryboard, provider: Networking)

    func instantiateInitialViewController() -> NearbyViewController
}

class NearbyWireframe: NearbyWireframeType {
    let storyboard: UIStoryboard!
    let provider : Networking

    required init(storyboard: UIStoryboard = UIStoryboard.main(), provider: Networking) {
        self.storyboard = storyboard
        self.provider = provider
    }

    func instantiateInitialViewController() -> NearbyViewController {
        let vc = self.storyboard.viewControllerWithID(.nearbyViewControllerID) as! NearbyViewController
        vc.viewModelConstructor = { _ in NearbyViewModel(provider: self.provider) }
        return vc
    }
}
