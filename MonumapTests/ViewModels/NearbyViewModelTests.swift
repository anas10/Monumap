//
//  NearbyViewModelTests.swift
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

class NearbyViewModelTests: QuickSpec {
    
    override func spec() {
        var disposeBag: DisposeBag!

        describe("NearbyViewModel") {

            beforeEach {
                disposeBag = DisposeBag()
            }

            describe("getMonuments") {
                it("returns monuments") {
                    var monuments = [Monument]()
                    var checked = false
                    let networking = MonumentsStubProvider.stubProvider(
                        monumentsSucceed: true,
                        monumentsCheck: {checked = true}
                    )
                    let subject = self.testSubject(provider: networking)

                    subject
                        .getMonuments()
                        .subscribe(onNext: { obj in
                            monuments = obj
                        }).addDisposableTo(disposeBag)

                    expect(checked).to(beTrue())
                    expect(monuments.count).to(beGreaterThan(0))
                }

                it("sends an error if request fails") {
                    var checked = false
                    let networking = MonumentsStubProvider.stubProvider(
                        monumentsSucceed: false,
                        monumentsCheck: {checked = true}
                    )
                    let subject = self.testSubject(provider: networking)

                    var errored = false
                    subject
                        .getMonuments()
                        .subscribe(onError: { _ in
                            errored = true
                        }).addDisposableTo(disposeBag)

                    expect(checked).to(beTrue())
                    expect(errored).to(beTrue())
                }
            }
        }
    }
    
}

extension NearbyViewModelTests {
    func testSubject(provider: Networking = Networking.newStubbingNetworking()
        ) -> NearbyViewModel {
        return NearbyViewModel(provider: provider)
    }
}
