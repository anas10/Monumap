//
//  MapViewController.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
import RxSwift
import MapKit
import CCHMapClusterController

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    var viewModel: MapViewModel!
    var viewModelConstructor: MapViewModelConstructorType!
    var mapViewClusterModel: MapViewClusterModel!

    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = viewModelConstructor(self)

        mapViewClusterModel = MapViewClusterModel(mapView: self.mapView)

        mapView.delegate = self

        viewModel
            .dataManager
            .monuments
            .asObservable()
            .subscribe(onNext: { monuments in
                self.mapViewClusterModel.addAnnotations(monuments.map { MonumentAnnotation(monument: $0) }, withCompletionHandler: nil)
            }).addDisposableTo(disposeBag)
    }
    
}

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return self.mapViewClusterModel.viewFor(annotation: annotation)
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        self.mapViewClusterModel.selectCluster(view: view)
    }

}

