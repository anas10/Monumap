//
//  SearchWireframe.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

typealias SearchViewModelConstructorType = (SearchViewController) -> (SearchViewModelType)

protocol SearchWireframeType {
    var storyboard : UIStoryboard! { get }

    init(storyboard: UIStoryboard, provider: Networking)

    func instantiateInitialViewController(dataManager: DataManager) -> SearchViewController
}

class SearchWireframe: SearchWireframeType {

    let storyboard: UIStoryboard!
    let provider : Networking

    required init(storyboard: UIStoryboard = UIStoryboard.main(), provider: Networking) {
        self.storyboard = storyboard
        self.provider = provider
    }

    func instantiateInitialViewController(dataManager: DataManager) -> SearchViewController {
        let vc = self.storyboard.viewControllerWithID(.searchViewControllerID) as! SearchViewController
        vc.viewModelConstructor = { _ in
            SearchViewModel(provider: self.provider , dataManager: dataManager)
        }
        return vc
    }
}
