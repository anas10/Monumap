//
//  main.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

/**
 The purpose of this file is to load the appdelegate only
 outside of a testing environment. This speeds up the tests.
 */

private func delegateClassName() -> String? {
    return NSClassFromString("XCTestCase") == nil ? NSStringFromClass(AppDelegate.self) : nil
}

let argv = UnsafeMutableRawPointer(CommandLine.unsafeArgv)
    .bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, delegateClassName())
