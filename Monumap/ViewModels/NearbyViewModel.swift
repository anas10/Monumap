//
//  NearbyViewModel.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
import RxSwift

protocol NearbyViewModelType {
    init(provider: Networking)

    func getMonuments() -> Observable<[Monument]>
}

class NearbyViewModel: NearbyViewModelType {
    let provider: Networking

    required init(provider: Networking) {
        self.provider = provider
    }

    func getMonuments() -> Observable<[Monument]> {
        return self.provider
            .request(BasicAPI.monuments)
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapToObjectArray(Monument.self, key: "data")
            .debug("monuments")
    }
}
