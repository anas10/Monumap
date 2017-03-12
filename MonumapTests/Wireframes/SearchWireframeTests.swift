//
//  SearchWireframeTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble

@testable import Monumap

class SearchWireframeTests: QuickSpec {

    override func spec() {
        var searchWireframe: SearchWireframeType!

        describe("SearchWireframe") {

            beforeEach {
                searchWireframe = SearchWireframe()
            }

            context("when initialised") {
                it("has a storyboard") {
                    expect(searchWireframe.storyboard).notTo(beNil())
                }
            }

            context("when instantiating") {
                it("it returns the right initial view controller") {
                    let subject = searchWireframe.instantiateInitialViewController()

                    expect(subject).to(beAKindOf(SearchViewController.self))
                    expect(subject.tabBarItem.title) == "SEARCH"
                    expect(subject.tabBarItem.image).notTo(beNil())
                }
            }

        }

    }

}
