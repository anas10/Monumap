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
                latitude: 51.38138961791992,
                longitude: -2.3586111068725588,
                location: "Avon, England"
            )
        }

        static func Monument2() -> Monument {
            return Monument(
                id: "8885b509-7ee5-4649-869d-28ced690d071",
                site: "Stonehenge, Avebury and Associated Sites",
                dateInscribed: "1986",
                latitude: 51.178890228271487,
                longitude: -1.8252778053283692,
                location: "Wiltshire, England"
            )
        }

        static func Monument3() -> Monument {
            return Monument(
                id: "1a2b60d0-4a40-4464-b40b-185d5e62a8db",
                site: "Tower of London",
                dateInscribed: "1988",
                latitude: 51.50805664062,
                longitude: -0.07611110806465149,
                location: "London Borough of Tower Hamlets, England"
            )
        }

        static func Monument4() -> Monument {
            return Monument(
                id: "ecf957a4-0a42-4737-bf80-20265ae88c24",
                site: "Gough and Inaccessible Islands",
                dateInscribed: "1995",
                latitude: -40.32472229003906,
                longitude: -9.928610801696778,
                location: "Tristan da Cunha Island group, St Helena Dependency"
            )
        }

        static func Monument5() -> Monument {
            return Monument(
                id: "0cb20f06-6787-4a23-9f5c-96f85d8ad447",
                site: "Historic Town of St George and Related Fortifications, Bermuda",
                dateInscribed: "2000",
                latitude: 32.37944412231445,
                longitude: -64.67778015136719,
                location: "St George, Bermuda"
            )
        }
    }
}
