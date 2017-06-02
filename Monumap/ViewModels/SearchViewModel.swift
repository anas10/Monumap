//
//  SearchViewModel.swift
//  Monumap
//
//  Created by Anas Ait Ali on 14/05/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
import RxSwift

protocol SearchViewModelType {
    var dataManager: DataManager { get }

    init(provider: Networking, dataManager: DataManager)
}

class SearchViewModel: SearchViewModelType {
    let provider: Networking
    let dataManager: DataManager

    required init(provider: Networking, dataManager: DataManager) {
        self.provider = provider
        self.dataManager = dataManager
    }

}
