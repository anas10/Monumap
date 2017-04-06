//
//  NearbyViewControllerTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 18/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Monumap

let sizes = [
    "iPhone5Portrait" : CGSize(width: 320, height: 568),
    "iPhonePlusPortrait" : CGSize(width: 414, height: 736),
    "iPadPortrait" : CGSize(width: 768, height: 1024),
    "iPadLandscape" : CGSize(width: 1024, height: 768)
]

class NearbyViewControllerTests: QuickSpec {

    override func spec() {
        var nearbyVC: NearbyViewController!

        describe("NearbyViewController") {
            beforeEach {
                nearbyVC = UIStoryboard.main().viewControllerWithID(.nearbyViewControllerID) as! NearbyViewController
                nearbyVC.viewModelConstructor = { _ in
                    NearbyViewModelTests.testSubject()
                }
                _ = nearbyVC.view
            }

            context("when initialised") {
                it("has all the variables initialised correctly") {
                    expect(nearbyVC.collectionView).notTo(beNil())
                    expect(nearbyVC.mapView).notTo(beNil())
                    expect(nearbyVC.viewModel).notTo(beNil())
                    expect(nearbyVC.viewModelConstructor).notTo(beNil())
                    expect(nearbyVC.mapViewClusterModel).notTo(beNil())
                    expect(nearbyVC.visibleMonuments.value.count) == 0
                    expect(nearbyVC.mapView.delegate).notTo(beNil())
                }

                it("looks good by default") {
                    nearbyVC.visibleMonuments.value = [
                        FakeObjects.FakeMonument.Monument1(),
                        FakeObjects.FakeMonument.Monument2(),
                        FakeObjects.FakeMonument.Monument3(),
                        FakeObjects.FakeMonument.Monument4(),
                        FakeObjects.FakeMonument.Monument5()
                    ]

                    expect(nearbyVC.view) == snapshot(sizes: sizes)
//                    expect(nearbyVC.view) == recordSnapshot(sizes: sizes)
                }

                it("gets the monuments") {
                    expect(nearbyVC.viewModel.dataManager.monuments.value.count) == 1052
                }

                it("adds the annotations") {
                    expect(nearbyVC.mapViewClusterModel.annotations.count) == 1052
                }
            }

            describe("getVisibleMonuments") {
                // TODO: Add tests
            }

        }

    }
    
}
