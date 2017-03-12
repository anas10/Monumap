//
//  SearchWireframe.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

protocol SearchWireframeType {
    var storyboard : UIStoryboard! { get }

    init(storyboard: UIStoryboard)

    func instantiateInitialViewController() -> SearchViewController
}

class SearchWireframe: SearchWireframeType {

    let storyboard: UIStoryboard!

    required init(storyboard: UIStoryboard = UIStoryboard.main()) {
        self.storyboard = storyboard
    }

    func instantiateInitialViewController() -> SearchViewController {
        return self.storyboard.viewControllerWithID(.searchViewControllerID) as! SearchViewController
    }
}
