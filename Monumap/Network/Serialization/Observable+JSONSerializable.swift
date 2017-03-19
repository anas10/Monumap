//
//  Observable+JSONSerializable.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Foundation
import Moya
import RxSwift

extension Observable {

    typealias JSONDictionary = [String: Any]

    // Get given JSONified data, pass back objects
    func mapToObject<B: JSONSerializable>(_ classType: B.Type, key: String? = nil) -> Observable<B> {
        return self.map { json in

            guard let dict = json as? JSONDictionary else {
                throw JSONSerializationError.invalidJSON
            }

            if let key = key {
                if let value = dict[key] {
                    guard let jsonDict = value as? JSONDictionary else {
                        throw JSONSerializationError.invalidJSON
                    }
                    return try B(json: jsonDict)
                } else { throw JSONSerializationError.missing(key) }
            }
            return try B(json: dict)
        }
    }

    // Get given JSONified data, pass back objects as an array
    func mapToObjectArray<B: JSONSerializable>(_ classType: B.Type, key: String? = nil) -> Observable<[B]> {
        return self.map { json in

            if let key = key {
                guard let dict = json as? JSONDictionary else {
                    throw JSONSerializationError.invalidJSON
                }

                if let value = dict[key] {
                    return try self.jsonToObjectArray(B.self, json: value)
                } else { throw JSONSerializationError.missing(key) }
            }

            return try self.jsonToObjectArray(B.self, json: json)
        }
    }

    fileprivate func jsonToObjectArray<T, B: JSONSerializable>(_ classType: B.Type, json: T) throws -> [B] {
        guard let array = json as? [JSONDictionary] else {
            throw JSONSerializationError.invalidJSON
        }

        return try array.map { try B(json: $0) }
    }

}

