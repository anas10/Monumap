//
//  NearbyWireframe.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

protocol NearbyWireframeType {
    var storyboard : UIStoryboard! { get }

    init(storyboard: UIStoryboard)

    func instantiateInitialViewController() -> NearbyViewController
}

class NearbyWireframe: NearbyWireframeType {

    let storyboard: UIStoryboard!

    required init(storyboard: UIStoryboard = UIStoryboard.main()) {
        self.storyboard = storyboard
    }

    func instantiateInitialViewController() -> NearbyViewController {
        return self.storyboard.viewControllerWithID(.nearbyViewControllerID) as! NearbyViewController
    }
}
