//
//  APIUtilsTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import SwiftyJSON
import Moya

@testable import Monumap

class APIUtilsTests: QuickSpec {
    
    override func spec() {
        describe("APIUtils") {
            describe("url") {
                it("return the right url") {
                    let subject = url(MonumapAPI.monuments)

                    expect(subject) == "\(MonumapConfiguration.scheme)://\(MonumapConfiguration.providerHost)\(MonumapConfiguration.pathToAPIs)\(MonumapAPI.monuments.path)"
                }
            }

            describe("composeBaseURL") {
                it("return the right url") {
                    let path = "/api"
                    var fakeComp = URLComponents()
                    fakeComp.host = MonumapConfiguration.providerHost
                    fakeComp.port = MonumapConfiguration.providerPort as Int?
                    fakeComp.path = path
                    fakeComp.scheme = MonumapConfiguration.scheme

                    let subject = composeBaseURL(path)

                    expect(subject) == fakeComp.url!
                }
            }

            describe("stubbedResponse") {
                it("return some data if file exists") {
                    let subject = stubbedResponse("Monuments")

                    expect(subject.isEmpty).to(beFalse())
                }

                it("return empty data if file doesnt exist") {
                    let subject = stubbedResponse("fakeFile")

                    expect(subject.isEmpty).to(beTrue())
                }
            }
        }
    }
    
}
