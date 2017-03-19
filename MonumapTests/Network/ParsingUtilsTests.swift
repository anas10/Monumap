//
//  ParsingUtilsTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import SwiftyJSON

@testable import Monumap

class ParsingUtilsTests: QuickSpec {
    
    override func spec() {

        describe("ParsingUtils") {
            describe("JSON") {
                describe("parseString") {
                    it("can parse a string") {
                        let myId = "myId123"
                        let dict = ["id": myId]
                        let source = JSON(dict)

                        let subject = try? source.parseString("id")
                        expect(subject) == myId
                    }

                    it("throws missing key") {
                        let dict = ["id2": "123"]
                        let source = JSON(dict)

                        do {
                            _ = try source.parseString("id")
                        }
                        catch let e as JSONSerializationError {
                            expect(e) == JSONSerializationError.missing("id")
                        }
                        catch {
                            fail("Wrong error thrown")
                        }
                    }

                    it("throws invalid key") {
                        let myId = 123
                        let dict = ["id": myId]
                        let source = JSON(dict)

                        do {
                            _ = try source.parseString("id")
                        }
                        catch let e as JSONSerializationError {
                            expect(e) == JSONSerializationError.invalid("id", JSON(myId))
                        }
                        catch {
                            fail("Wrong error thrown")
                        }
                    }
                }
            }
        }

    }
    
}
