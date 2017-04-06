//
//  MonumentAnnotationTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 26/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble

@testable import Monumap

class MonumentAnnotationTests: QuickSpec {
    
    override func spec() {

        describe("MonumentAnnotation") {
            it("is inialised correctly") {
                let monument = FakeObjects.FakeMonument.Monument1()
                let subject = MonumentAnnotation(monument: monument)

                expect(subject.coordinate.latitude) == monument.latitude
                expect(subject.coordinate.longitude) == monument.longitude
                expect(subject.title) == monument.site
                expect(subject.monument) == monument
            }
        }

    }
    
}
