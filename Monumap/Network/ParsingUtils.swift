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
}
