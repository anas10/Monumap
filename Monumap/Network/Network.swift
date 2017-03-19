//
//  Network.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import Alamofire

public typealias BasicAPI = MonumapAPI

public class OnlineProvider<Target>: RxMoyaProvider<Target> where Target: TargetType {

    public override init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
                         requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider.defaultRequestMapping,
                         stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub,
                         manager: Manager = RxMoyaProvider<Target>.defaultAlamofireManager(),
                         plugins: [PluginType] = [],
                         trackInflights: Bool = false) {

        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, manager: manager, plugins: plugins, trackInflights: trackInflights)
    }
}

public protocol NetworkingType {
    associatedtype T: TargetType
    var provider: OnlineProvider<T> { get }
}

public struct Networking: NetworkingType {
    public typealias T = BasicAPI
    public let provider: OnlineProvider<BasicAPI>
}

// "Public" interfaces
extension Networking {

    public static func newDefaultNetworking() -> Networking {
        return Networking(provider:
            OnlineProvider(endpointClosure: endpointsClosure(),
                           requestClosure: Networking.endpointResolver(),
                           stubClosure: { _ in return StubBehavior.never },
                           plugins: plugins))
    }

    public static func newStubbingNetworking(delay: TimeInterval = 0) -> Networking {
        return Networking(provider:
            OnlineProvider(endpointClosure: endpointsClosure(),
                           requestClosure: Networking.endpointResolver(),
                           stubClosure: (delay > 0 ? MoyaProvider.delayedStub(delay) : MoyaProvider.immediatelyStub)))
    }

    public func request(_ route: BasicAPI, defaults: UserDefaults = UserDefaults.standard) -> Observable<Moya.Response> {
        return self.provider.request(route)
    }
}

// Static methods
public extension NetworkingType {

    static func endpointsClosure<T>() -> (_ target: T) -> Endpoint<T> where T: TargetType {
        return { target in
            return Endpoint<T>(url: url(target),
                               sampleResponseClosure: {.networkResponse(200, target.sampleData)},
                               method: target.method,
                               parameters: target.parameters,
                               parameterEncoding: target.parameterEncoding)
        }
    }

    static var plugins: [PluginType] {
        return [
            NetworkLoggerPlugin(verbose: true)
        ]
    }

    public static func endpointResolver<T>() -> MoyaProvider<T>.RequestClosure where T: TargetType {
        return { (endpoint, closure) in
            var request = endpoint.urlRequest!
            request.httpShouldHandleCookies = false
            closure(.success(request))
        }
    }
}
