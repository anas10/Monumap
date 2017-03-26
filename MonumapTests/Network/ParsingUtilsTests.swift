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

            describe("JSON extension") {

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

                describe("parseLatitude") {
                    it("can parse a latitude") {
                        let lat = 51.38138961791992
                        let dict = ["lat": lat]
                        let source = JSON(dict)

                        let subject = try? source.parseLatitude("lat")
                        expect(subject) == lat
                    }

                    it("throws missing key") {
                        let dict = ["lat1": 51.23]
                        let source = JSON(dict)

                        do {
                            _ = try source.parseLatitude("lat")
                            let ret = try? source.parseLatitude("lat")
                            expect(ret).to(beNil())
                        }
                        catch let e as JSONSerializationError {
                            expect(e) == JSONSerializationError.missing("lat")
                        }
                        catch {
                            fail("Wrong error thrown")
                        }
                    }

                    it("throws invalid key") {
                        let lat = "asd"
                        let dict = ["lat": lat]
                        let source = JSON(dict)

                        do {
                            _ = try source.parseLatitude("lat")
                            let ret = try? source.parseLatitude("lat")
                            expect(ret).to(beNil())
                        }
                        catch let e as JSONSerializationError {
                            expect(e) == JSONSerializationError.invalid("lat", JSON(lat))
                        }
                        catch {
                            fail("Wrong error thrown")
                        }
                    }

                    it("throws invalid if value isn't a valid coordinate") {
                        let lat = 100
                        let dict = ["lat": lat]
                        let source = JSON(dict)

                        do {
                            _ = try source.parseLatitude("lat")
                            let ret = try? source.parseLatitude("lat")
                            expect(ret).to(beNil())
                        }
                        catch let e as JSONSerializationError {
                            expect(e) == JSONSerializationError.invalid("latitude value", JSON(lat))
                        }
                        catch {
                            fail("Wrong error thrown")
                        }
                    }
                }

                describe("parseLongitude") {
                    it("can parse a longitude") {
                        let lon = -2.3586111068725588
                        let dict = ["lon": lon]
                        let source = JSON(dict)

                        let subject = try? source.parseLongitude("lon")
                        expect(subject) == lon
                    }

                    it("throws missing key") {
                        let dict = ["lon1": -2.35]
                        let source = JSON(dict)

                        do {
                            _ = try source.parseLongitude("lon")
                            let ret = try? source.parseLongitude("lon")
                            expect(ret).to(beNil())
                        }
                        catch let e as JSONSerializationError {
                            expect(e) == JSONSerializationError.missing("lon")
                        }
                        catch {
                            fail("Wrong error thrown")
                        }
                    }

                    it("throws invalid key") {
                        let lon = "asd"
                        let dict = ["lon": lon]
                        let source = JSON(dict)

                        do {
                            _ = try source.parseLongitude("lon")
                            let ret = try? source.parseLongitude("lon")
                            expect(ret).to(beNil())
                        }
                        catch let e as JSONSerializationError {
                            expect(e) == JSONSerializationError.invalid("lon", JSON(lon))
                        }
                        catch {
                            fail("Wrong error thrown")
                        }
                    }

                    it("throws invalid if value isn't a valid coordinate") {
                        let lon = 190
                        let dict = ["lon": lon]
                        let source = JSON(dict)

                        do {
                            _ = try source.parseLongitude("lon")
                            let ret = try? source.parseLongitude("lon")
                            expect(ret).to(beNil())
                        }
                        catch let e as JSONSerializationError {
                            expect(e) == JSONSerializationError.invalid("longitude value", JSON(lon))
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
