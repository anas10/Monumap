//
//  JSONSerializable.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JSONSerializable {
    init(json: [String: Any]) throws
}

enum JSONSerializationError: Error {
    case missing(String)
    case invalid(String, JSON)
    case invalidJSON
}

extension JSONSerializationError : Equatable {}

func ==(lhs: JSONSerializationError, rhs: JSONSerializationError) -> Bool {
    switch (lhs, rhs) {
    case (let .missing(s1), let .missing(s2)):
        return s1 == s2
    case (let .invalid(s1, a1), let .invalid(s2, a2)):
        return s1 == s2 && a1 == a2
    case (.invalidJSON, .invalidJSON):
        return true
    default:
        return false
    }
}

