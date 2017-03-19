//
//  NearbyWireframeTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble

@testable import Monumap

class NearbyWireframeTests: QuickSpec {
        
    override func spec() {
        var nearbyWireframe: NearbyWireframeType!

        describe("NearbyWireframe") {

            beforeEach {
                nearbyWireframe = NearbyWireframe(
                    provider: Networking.newStubbingNetworking()
                )
            }

            context("when initialised") {
                it("has a storyboard") {
                    expect(nearbyWireframe.storyboard).notTo(beNil())
                }
            }

            context("when instantiating") {
                it("it returns the right initial view controller") {
                    let subject = nearbyWireframe.instantiateInitialViewController()

                    expect(subject).to(beAKindOf(NearbyViewController.self))
                    expect(subject.tabBarItem.title) == "NEARBY"
                    expect(subject.tabBarItem.image).notTo(beNil())
                }
            }
            
        }
        
    }
    
}
