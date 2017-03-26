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
    init(provider: Networking, dataManager: DataManager)

    func getMonuments() -> Observable<[Monument]>
}

class NearbyViewModel: NearbyViewModelType {
    let provider: Networking
    let dataManager: DataManager

    required init(provider: Networking, dataManager: DataManager) {
        self.provider = provider
        self.dataManager = dataManager
    }

    func getMonuments() -> Observable<[Monument]> {
        return self.provider
            .request(BasicAPI.monuments)
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapToObjectArray(Monument.self, key: "data")
            .flatMap { monuments -> Observable<[Monument]> in
                var tmpMonuments = [Monument]()
                tmpMonuments.append(contentsOf: monuments)
                self.dataManager.monuments.value.forEach {
                    if !tmpMonuments.contains($0) {
                        tmpMonuments.append($0)
                    }
                }
                self.dataManager.monuments.value = tmpMonuments
                return self.dataManager.monuments.asObservable()
            }
            .debug("monuments", trimOutput: true)
    }
}
