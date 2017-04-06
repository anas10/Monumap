//
//  MapWireframeTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble

@testable import Monumap

class MapWireframeTests: QuickSpec {

    override func spec() {
        var mapWireframe: MapWireframeType!

        describe("MapWireframe") {

            beforeEach {
                mapWireframe = MapWireframe(provider: Networking.newStubbingNetworking())
            }

            context("when initialised") {
                it("has a storyboard") {
                    expect(mapWireframe.storyboard).notTo(beNil())
                }
            }

            context("when instantiating") {
                it("it returns the right initial view controller") {
                    let subject = mapWireframe.instantiateInitialViewController(dataManager: DataManager())

                    expect(subject).to(beAKindOf(MapViewController.self))
                    expect(subject.tabBarItem.title) == "MAP"
                    expect(subject.tabBarItem.image).notTo(beNil())
                    expect(subject.viewModelConstructor).notTo(beNil())
                }
            }
            
        }
        
    }
    
}

