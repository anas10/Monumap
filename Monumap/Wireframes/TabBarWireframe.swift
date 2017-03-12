//
//  TabBarWireframe.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

protocol TabBarWireframeType {
    func instantiateTabBarController() -> UITabBarController
}

class TabBarWireframe: TabBarWireframeType {

    func instantiateTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()

        tabBarController.viewControllers  = [
            NearbyWireframe().instantiateInitialViewController(),
            MapWireframe().instantiateInitialViewController(),
            SearchWireframe().instantiateInitialViewController()
        ]

        return tabBarController
    }
}
