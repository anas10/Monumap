//
//  MapWireframe.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

protocol MapWireframeType {
    var storyboard : UIStoryboard! { get }

    init(storyboard: UIStoryboard)

    func instantiateInitialViewController() -> MapViewController
}

class MapWireframe: MapWireframeType {

    let storyboard: UIStoryboard!

    required init(storyboard: UIStoryboard = UIStoryboard.main()) {
        self.storyboard = storyboard
    }

    func instantiateInitialViewController() -> MapViewController {
        return self.storyboard.viewControllerWithID(.mapViewControllerID) as! MapViewController
    }
}

