//
//  MapViewControllerTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import RxSwift

@testable import Monumap

class MapViewControllerTests: QuickSpec {
    
    override func spec() {
        var mapVC: MapViewController!
        let disposeBag = DisposeBag()

        describe("MapViewController") {
            beforeEach {
                let dataManager = DataManager()
                let nearbyVM = NearbyViewModelTests.testSubject(dataManager: dataManager)
                nearbyVM.getMonuments().subscribe().addDisposableTo(disposeBag)
                mapVC = UIStoryboard.main().viewControllerWithID(.mapViewControllerID) as! MapViewController
                mapVC.viewModelConstructor = { _ in
                    MapViewModel(
                        provider: Networking.newStubbingNetworking(),
                        dataManager: dataManager
                    )
                }
                _ = mapVC.view
            }

            context("when initialised") {
                it("has all the variables initialised correctly") {
                    expect(mapVC.mapView).notTo(beNil())
                    expect(mapVC.viewModel).notTo(beNil())
                    expect(mapVC.viewModelConstructor).notTo(beNil())
                    expect(mapVC.mapViewClusterModel).notTo(beNil())
                    expect(mapVC.mapView.delegate).notTo(beNil())
                }

                it("looks good by default") {
                    expect(mapVC.view) == snapshot(sizes: sizes)
//                    expect(mapVC.view) == recordSnapshot(sizes: sizes)
                }

                it("adds the annotations") {
                    expect(mapVC.mapViewClusterModel.annotations.count) == 1052
                }
            }
            
        }
    }
    
}
