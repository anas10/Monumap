//
//  AppDelegate.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

// This is commented as we now use the main.swift instead
//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    #if DEBUG
    let provider = Networking.newStubbingNetworking()
    #else
    let provider = Networking.newDefaultNetworking()
    #endif

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window?.rootViewController = TabBarWireframe(provider: provider).instantiateTabBarController()

        return true
    }

}

