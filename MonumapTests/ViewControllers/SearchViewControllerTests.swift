//
//  SearchViewControllerTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Monumap

class SearchViewControllerTests: QuickSpec {

    override func spec() {
        var searchVC: SearchViewController!

        describe("SearchViewController") {
            beforeEach {
                searchVC = UIStoryboard.main().viewControllerWithID(.searchViewControllerID) as! SearchViewController
                _ = searchVC.view
            }

            context("when initialised") {
                it("looks good by default") {
                    expect(searchVC.view) == snapshot(sizes: sizes)
//                    expect(searchVC.view) == recordSnapshot(sizes: sizes)
                }
            }
            
        }
    }

}
