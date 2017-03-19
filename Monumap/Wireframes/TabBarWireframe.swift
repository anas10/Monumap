//
//  TabBarWireframe.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

protocol TabBarWireframeType {
    var provider : Networking { get }

    init(provider: Networking)

    func instantiateTabBarController() -> UITabBarController
}

class TabBarWireframe: TabBarWireframeType {
    let provider : Networking

    required init(provider: Networking) {
        self.provider = provider
    }

    func instantiateTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()

        tabBarController.viewControllers  = [
            NearbyWireframe(provider: self.provider).instantiateInitialViewController(),
            MapWireframe().instantiateInitialViewController(),
            SearchWireframe().instantiateInitialViewController()
        ]

        return tabBarController
    }
}
