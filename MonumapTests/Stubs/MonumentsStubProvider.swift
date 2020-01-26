//
//  MonumentsStubProvider.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Foundation
import Nimble
import Moya

@testable import Monumap

class MonumentsStubProvider {
    typealias Check = (() -> ())?

    static func stubProvider(monumentsSucceed: Bool, monumentsCheck: Check) -> Networking {

        let endpointsClosure = { (target: MonumapAPI) -> Endpoint in

            switch target {
            case .monuments:
                monumentsCheck?()
                return Endpoint(url: url(target),
                                sampleResponseClosure: {
                                    .networkResponse(monumentsSucceed ? 200 : 403, target.sampleData)},
                                method: target.method,
                                task: target.task,
                                httpHeaderFields: target.headers)
            }
        }

        return Networking(provider: OnlineProvider(
            endpointClosure: endpointsClosure,
            requestClosure: Networking.endpointResolver(),
            stubClosure: MoyaProvider.immediatelyStub)
        )
    }
}
