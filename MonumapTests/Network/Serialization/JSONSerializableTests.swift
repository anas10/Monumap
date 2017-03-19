//
//  JSONSerializableTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import SwiftyJSON

@testable import Monumap

class JSONSerializableTests: QuickSpec {
    
    override func spec() {
        describe("JSONSerializableError") {
            it("is equatable") {
                let case1 = JSONSerializationError.missing("case1")
                let case2 = JSONSerializationError.missing("case2")

                expect(case1) == case1
                expect(case1) != case2

                let case3 = JSONSerializationError.invalid("case3", JSON(1))

                expect(case1) != case3

                let case4 = JSONSerializationError.invalid("case4", JSON(1))
                let case5 = JSONSerializationError.invalid("case3", JSON("1"))

                expect(case3) == case3
                expect(case3) != case4
                expect(case3) != case5

                let case6 = JSONSerializationError.invalidJSON
                expect(case6) == case6
                expect(case1) != case6
            }
        }
    }
    
}
