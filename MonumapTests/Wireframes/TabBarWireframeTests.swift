//
//  TabBarWireframeTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble

@testable import Monumap

class TabBarWireframeTests: QuickSpec {

    override func spec() {
        var tabBarWireframe: TabBarWireframeType!

        describe("TabBarWireframe") { 

            beforeEach {
                tabBarWireframe = TabBarWireframe(
                    provider: Networking.newStubbingNetworking()
                )
            }

            context("when instantiating") {
                it("return a uitabbarcontroller correctly set") {
                    let subject = tabBarWireframe.instantiateTabBarController()

                    expect(subject).to(beAKindOf(UITabBarController.self))
                    expect(subject.viewControllers?.count) == 3
                }
            }

        }

    }
}
