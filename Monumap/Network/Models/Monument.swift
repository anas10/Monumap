//
//  Monument.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Monument {
    let id: String
    let site: String
    let dateInscribed: String
    let location: String?
}

extension Monument : JSONSerializable {
    init(json: [String : Any]) throws {
        let source = JSON(json)

        self.id = try! source.parseString("id")
        self.site = try! source.parseString("site")
        self.dateInscribed = try! source.parseString("date_inscribed")
        self.location = try? source.parseString("location")
    }
}
