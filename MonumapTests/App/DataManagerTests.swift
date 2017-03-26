//
//  DataManagerTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 26/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble

@testable import Monumap

class DataManagerTests: QuickSpec {

    override func spec() {
        var dataManager : DataManager!

        describe("a dataManager") {
            beforeEach {
                dataManager = DataManager()
            }

            context("when initialized") {
                it("has an empty monuments array") {
                    expect(dataManager.monuments.value.count) == 0
                }
            }
        }
        
    }
    
}
