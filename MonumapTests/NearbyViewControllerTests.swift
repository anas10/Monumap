//
//  NearbyViewControllerTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 18/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Monumap

class NearbyViewControllerTests: QuickSpec {

    override func spec() {
        var nearbyVC: NearbyViewController!

        let sizes = [
            "iPhone5Portrait" : CGSize(width: 320, height: 568),
            "iPhonePlusPortrait" : CGSize(width: 414, height: 736),
            "iPadPortrait" : CGSize(width: 768, height: 1024),
            "iPadLandscape" : CGSize(width: 1024, height: 768)
        ]

        describe("NearbyViewController") { 
            beforeEach {
                nearbyVC = UIStoryboard.main().viewControllerWithID(.nearbyViewControllerID) as! NearbyViewController
                _ = nearbyVC.view
            }

            context("when initialised") {
                it("looks good by default") {
                    expect(nearbyVC.view) == snapshot(sizes: sizes)
//                    expect(nearbyVC.view) == recordSnapshot(sizes: sizes)
                }
            }

        }

    }
    
}

extension UIViewController {

    func loadViewProgrammatically(){
        self.beginAppearanceTransition(true, animated: false)
        self.endAppearanceTransition()
    }
}

