//
//  Observable+JSONSerializableTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import SwiftyJSON
import RxSwift

@testable import Monumap

class Observable_JSONSerializableTests: QuickSpec {
    
    override func spec() {
        var disposeBag: DisposeBag!

        describe("Observable+JSONSerializable") {
            beforeEach {
                disposeBag = DisposeBag()
            }

            describe("mapToObject") {
                it("returns objects from JSON without a key") {
                    let myId = "myStringId"
                    let data = ["id": myId]
                    var testStruct: TestStruct!
                    Observable
                        .just(data)
                        .mapToObject(TestStruct.self)
                        .subscribe(onNext: { obj in
                            testStruct = obj
                        }).addDisposableTo(disposeBag)

                    expect(testStruct.id) == myId
                }

                it("returns objects from JSON with a key") {
                    let myId = "myStringId"
                    let data = [
                        "myKey": ["id": myId]
                    ]
                    var testStruct: TestStruct!
                    Observable
                        .just(data)
                        .mapToObject(TestStruct.self, key: "myKey")
                        .subscribe(onNext: { obj in
                            testStruct = obj
                        }).addDisposableTo(disposeBag)

                    expect(testStruct.id) == myId
                }

                it("throws an error when json is invalid without a key") {
                    let data = ["wrongObject"]

                    var error: JSONSerializationError!
                    Observable
                        .just(data)
                        .mapToObject(TestStruct.self)
                        .subscribe(onError: { e in
                            if let e = e as? JSONSerializationError {
                                error = e
                            } else { fail("wrong error type") }
                        }).addDisposableTo(disposeBag)

                    expect(error) == JSONSerializationError.invalidJSON
                }

                it("throws an error when json is invalid with a key") {
                    let data = [
                        "myKey" : "wrongObject"
                    ]

                    var error: JSONSerializationError!
                    Observable
                        .just(data)
                        .mapToObject(TestStruct.self, key: "myKey")
                        .subscribe(onError: { e in
                            if let e = e as? JSONSerializationError {
                                error = e
                            } else { fail("wrong error type") }
                        }).addDisposableTo(disposeBag)

                    expect(error) == JSONSerializationError.invalidJSON
                }

                it("throws an error with invalid key") {
                    let data = [
                        "myKey" : "ignored"
                    ]

                    var error: JSONSerializationError!
                    Observable
                        .just(data)
                        .mapToObject(TestStruct.self, key: "myKey2")
                        .subscribe(onError: { e in
                            if let e = e as? JSONSerializationError {
                                error = e
                            } else { fail("wrong error type") }
                        }).addDisposableTo(disposeBag)

                    expect(error) == JSONSerializationError.missing("myKey2")
                }
            }

            describe("mapToObjectArray") {
                context("without a key") {
                    it("returns array of objects from JSON") {
                        let data = [
                            ["id": "myId1"],
                            ["id": "myId2"],
                            ["id": "myId3"]
                        ]
                        var subject = [TestStruct]()
                        Observable
                            .just(data)
                            .mapToObjectArray(TestStruct.self)
                            .subscribe(onNext: { obj in
                                subject = obj
                            }).addDisposableTo(disposeBag)

                        expect(subject.count) == 3
                    }

                    it("throws an error when json is invalid") {
                        let data = ["id": "myId1"]

                        var error: JSONSerializationError!
                        Observable
                            .just(data)
                            .mapToObjectArray(TestStruct.self)
                            .subscribe(onError: { e in
                                if let e = e as? JSONSerializationError {
                                    error = e
                                } else { fail("wrong error type") }
                            }).addDisposableTo(disposeBag)

                        expect(error) == JSONSerializationError.invalidJSON
                    }
                }

                context("with a key") {
                    it("returns array of objects from JSON") {
                        let data = [
                            "myKey" : [
                                ["id": "myId1"],
                                ["id": "myId2"],
                                ["id": "myId3"]
                            ]
                        ]
                        var subject = [TestStruct]()
                        Observable
                            .just(data)
                            .mapToObjectArray(TestStruct.self, key: "myKey")
                            .subscribe(onNext: { obj in
                                subject = obj
                            }).addDisposableTo(disposeBag)

                        expect(subject.count) == 3
                    }

                    it("throws an error when json is invalid") {
                        let data = ["wrongObject"]

                        var error: JSONSerializationError!
                        Observable
                            .just(data)
                            .mapToObjectArray(TestStruct.self, key: "myKey")
                            .subscribe(onError: { e in
                                if let e = e as? JSONSerializationError {
                                    error = e
                                } else { fail("wrong error type") }
                            }).addDisposableTo(disposeBag)

                        expect(error) == JSONSerializationError.invalidJSON
                    }

                    it("throws an error when json is invalid and key valid") {
                        let data = [
                            "myKey": "wrongObject"
                        ]

                        var error: JSONSerializationError!
                        Observable
                            .just(data)
                            .mapToObjectArray(TestStruct.self, key: "myKey")
                            .subscribe(onError: { e in
                                if let e = e as? JSONSerializationError {
                                    error = e
                                } else { fail("wrong error type") }
                            }).addDisposableTo(disposeBag)

                        expect(error) == JSONSerializationError.invalidJSON
                    }

                    it("throws an error with invalid key") {
                        let data = [
                            "myKey" : "ignored"
                        ]

                        var error: JSONSerializationError!
                        Observable
                            .just(data)
                            .mapToObjectArray(TestStruct.self, key: "myKey2")
                            .subscribe(onError: { e in
                                if let e = e as? JSONSerializationError {
                                    error = e
                                } else { fail("wrong error type") }
                            }).addDisposableTo(disposeBag)
                        
                        expect(error) == JSONSerializationError.missing("myKey2")
                    }
                }
            }
        }
    }
    
}

fileprivate struct TestStruct {
    let id: String
}

extension TestStruct : JSONSerializable {
    init(json: [String : Any]) throws {
        let source = JSON(json)
        self.id = try! source.parseString("id")
    }
}
