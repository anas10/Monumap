//
//  Monument+FakeObjects.swift
//  Monumap
//
//  Created by Anas Ait Ali on 20/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
@testable import Monumap

extension FakeObjects {
    class FakeMonument {
        static func Monument1() -> Monument {
            return Monument(
                id: "5be4dcbc-ab0b-4aae-92a3-e11afb4b96ef",
                site: "City of Bath",
                dateInscribed: "1987",
                location: "Avon, England"
            )
        }

        static func Monument2() -> Monument {
            return Monument(
                id: "8885b509-7ee5-4649-869d-28ced690d071",
                site: "Stonehenge, Avebury and Associated Sites",
                dateInscribed: "1986",
                location: "Wiltshire, England"
            )
        }
    }
}
