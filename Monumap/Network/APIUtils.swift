//
//  APIUtils.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Foundation
import Moya

func url(_ route: TargetType) -> String {
    var components = URLComponents(url: route.baseURL, resolvingAgainstBaseURL: true)!
    components.path = "\(components.path)\(route.path)"
    return components.string!
}

func composeBaseURL(_ path: String) -> URL {
    var components = URLComponents()
    components.host = MonumapConfiguration.providerHost
    components.port = MonumapConfiguration.providerPort as Int?
    components.path = path
    components.scheme = MonumapConfiguration.scheme
    return components.url!
}

func stubbedResponse(_ filename: String) -> Data {
    @objc class StubClass: NSObject { }

    let bundle = Bundle(for: StubClass.self)
    if let path = bundle.path(forResource: filename, ofType: "json") {
        let urlRef = URL(fileURLWithPath: path)
        return try! Data(contentsOf: urlRef)
    }
    return "".data(using: String.Encoding.utf8)!
}
