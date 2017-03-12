//
//  AppDelegateTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble

@testable import Monumap

class AppDelegateTests: QuickSpec {
    override func spec() {

        var appDelegate: AppDelegate!

        describe("AppDelegate") {

            beforeEach {
                appDelegate = AppDelegate()
            }

            context("when didFinishLaunching") {
                it("set the tabbarcontroller as root") {

                    appDelegate.window = UIWindow()

                    let f = appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)

                    expect(f).to(beTrue())
                    expect(appDelegate.window?.rootViewController).to(beAKindOf(UITabBarController.self))
                }
            }
        }
        
    }
}
