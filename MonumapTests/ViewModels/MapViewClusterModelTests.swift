//
//  MapViewClusterModelTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 14/04/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import MapKit

@testable import Monumap

class MapViewClusterModelTests: QuickSpec {
    
    override func spec() {
        var mapViewClusterModel: MapViewClusterModel!

        fdescribe("MapViewClusterModel") {
            beforeEach {
                mapViewClusterModel = MapViewClusterModel(mapView: MKMapView(frame: CGRect.zero))
            }

            context("when initialised") {
                it("has all the variables initialised correctly") {
                    expect(mapViewClusterModel.delegate).notTo(beNil())
                    expect(mapViewClusterModel.marginFactor) == 0.0
                }
            }

            describe("viewFor") {
                //TODO: Tests
            }

            describe("selectCluster") {
                //TODO: Tests
            }
        }

    }
    
}
