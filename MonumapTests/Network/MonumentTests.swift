//
//  MonumentTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 26/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble

@testable import Monumap

class MonumentTests: QuickSpec {
    
    override func spec() {

        describe("Monument") {

            it("is serializable") {
                let id = "id1"
                let site = "A site"
                let dateInscribed = "1987"
                let latitude = 51.28
                let longitude = -2.35
                let location = "A location"
                let data : [String : Any] = [
                    "id": id,
                    "site": site,
                    "date_inscribed": dateInscribed,
                    "latitude": latitude,
                    "longitude": longitude,
                    "location": location
                ]

                let subject = try? Monument(json: data)

                expect(subject).notTo(beNil())

                if let subject = subject {
                    expect(subject.id) == id
                    expect(subject.site) == site
                    expect(subject.dateInscribed) == dateInscribed
                    expect(subject.latitude) == latitude
                    expect(subject.longitude) == longitude
                    expect(subject.location) == location
                }
            }

        }
    }
    
}
