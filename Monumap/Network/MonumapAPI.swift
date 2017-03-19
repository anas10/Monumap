//
//  MonumapAPI.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
import Moya

public enum MonumapAPI {
    case monuments
}

extension MonumapAPI: TargetType {
    public var baseURL: URL {return MonumapConfiguration.providerURL as URL}

    public var path: String {
        switch self {
        case .monuments:
            return "/monuments"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .monuments:
            return .get
        }
    }

    public var parameters: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }

    public var parameterEncoding: ParameterEncoding {
        switch self {
        default:
            return URLEncoding.default
        }
    }

    public var sampleData: Data {
        switch self {
        case .monuments:
            return stubbedResponse("Monuments")

//        default:
//            return "".data(using: String.Encoding.utf8)!
        }
    }
    
    public var task: Task {
        return .request
    }
}
