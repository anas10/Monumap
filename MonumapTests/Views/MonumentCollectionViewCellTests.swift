//
//  MonumentCollectionViewCellTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Monumap

class MonumentCollectionViewCellTests: QuickSpec {
    let size = ["defaultSize": CGSize(width: 200, height: 275)]

    override func spec() {
        var monumentCell: MonumentCollectionViewCell!

        describe("MonumentCollectionViewCell") {
            beforeEach {
                let vc = UIStoryboard.main()
                    .viewControllerWithID(.nearbyViewControllerID) as! NearbyViewController
                vc.viewModelConstructor = { _ in
                    NearbyViewModelTests.testSubject()
                }
                vc.visibleMonuments.value = [FakeObjects.FakeMonument.Monument1()]
                _ = vc.view

                let indexPath = IndexPath(row: 0, section: 0)
                monumentCell = vc
                    .collectionView
                    .dequeueReusableCell(
                        withReuseIdentifier: "siteCellIdentifier",
                        for: indexPath) as! MonumentCollectionViewCell
            }

            context("when initialized") {
                it("looks good by default") {
                    monumentCell.configure(monument: FakeObjects.FakeMonument.Monument1())
                    expect(monumentCell) == snapshot(sizes: self.size)
//                    expect(monumentCell) == recordSnapshot(sizes: self.size)
                }

                it("has all the iboutlets links") {
                    expect(monumentCell.image).notTo(beNil())
                    expect(monumentCell.site).notTo(beNil())
                    expect(monumentCell.location).notTo(beNil())
                    expect(monumentCell.dateInscribed).notTo(beNil())
                }
                
            }
        }
    }
    
}
