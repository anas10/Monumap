//
//  MapViewControllerTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Monumap

class MapViewControllerTests: QuickSpec {
    
    override func spec() {
        var mapVC: MapViewController!

        describe("MapViewController") {
            beforeEach {
                mapVC = UIStoryboard.main().viewControllerWithID(.mapViewControllerID) as! MapViewController
                _ = mapVC.view
            }

            context("when initialised") {
                it("looks good by default") {
                    expect(mapVC.view) == snapshot(sizes: sizes)
//                    expect(mapVC.view) == recordSnapshot(sizes: sizes)
                }
            }
            
        }
    }
    
}
