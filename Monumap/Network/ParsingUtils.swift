//
//  ParsingUtils.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
    func parseString(_ key: String) throws -> String {
        guard self[key].exists() else { throw JSONSerializationError.missing(key) }
        guard let ret = self[key].string else { throw JSONSerializationError.invalid(key, self[key]) }
        return ret
    }

    func parseLatitude(_ key: String) throws -> Double {
        guard self[key].exists() else { throw JSONSerializationError.missing(key) }
        guard let ret = self[key].double else { throw JSONSerializationError.invalid(key, self[key]) }
        guard case (-90...90) = ret else {
            throw JSONSerializationError.invalid("latitude value", self[key])
        }
        return ret
    }

    func parseLongitude(_ key: String) throws -> Double {
        guard self[key].exists() else { throw JSONSerializationError.missing(key) }
        guard let ret = self[key].double else { throw JSONSerializationError.invalid(key, self[key]) }
        guard case (-180...180) = ret else {
            throw JSONSerializationError.invalid("longitude value", self[key])
        }
        return ret
    }
}
