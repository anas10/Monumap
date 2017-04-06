//
//  MonumentClusterAnnotationViewTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 07/04/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import MapKit

@testable import Monumap

class MonumentClusterAnnotationViewTests: QuickSpec {
    
    override func spec() {
        var mcaView: MonumentClusterAnnotationView!

        describe("a MonumentClusterAnnotationView") {
            beforeEach {
                mcaView = MonumentClusterAnnotationView(annotation: nil, reuseIdentifier: nil)
            }

            context("when initialised") {
                it("looks good by default") {
                    expect(mcaView.count) == 0
                    expect(mcaView.canShowCallout).to(beTrue())
                    expect(mcaView) == snapshot()
                }
            }

            context("when count is 1") {
                it("shows only the image") {
                    mcaView.count = 1

                    expect(mcaView.canShowCallout).to(beTrue())
                    expect(mcaView) == snapshot()
                }
            }

            context("when count is greater than 1") {
                it("shows only the count") {
                    mcaView.count = 3

                    expect(mcaView.canShowCallout).to(beFalse())
                    expect(mcaView) == snapshot()
                }
            }
        }

    }
    
}
