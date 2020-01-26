//
//  NearbyViewController.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MapKit
import CCHMapClusterController

class NearbyViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!

    var viewModel: NearbyViewModel!
    var viewModelConstructor: NearbyViewModelConstructorType!
    var mapViewClusterModel: MapViewClusterModel!

    let visibleMonuments : Variable<[Monument]> = Variable([])

    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = viewModelConstructor(self)

        mapViewClusterModel = MapViewClusterModel(mapView: self.mapView)

        mapView.delegate = self

        // Fetch the monuments
        viewModel.getMonuments().subscribe().addDisposableTo(disposeBag)

        self.visibleMonuments
            .asObservable()
            .bind(to: collectionView.rx.items) { (collectionView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "siteCellIdentifier", for: indexPath) as! MonumentCollectionViewCell
                cell.configure(monument: element)
                return cell
            }
            .disposed(by: disposeBag)

        viewModel
            .dataManager
            .monuments
            .asObservable()
            .subscribe(onNext: { monuments in
                self.mapViewClusterModel.addAnnotations(monuments.map { MonumentAnnotation(monument: $0) }, withCompletionHandler: nil)
        }).addDisposableTo(disposeBag)
    }

    func getVisibleMonuments(mapView: MKMapView) -> [Monument] {
        return mapView
            .annotations(in: mapView.visibleMapRect)
            .compactMap { ($0 as? CCHMapClusterAnnotation)?.annotations as? Set<MonumentAnnotation> }
            .flatMap { $0 }
            .compactMap { $0.monument }
    }

}

extension NearbyViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return self.mapViewClusterModel.viewFor(annotation: annotation)
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        self.mapViewClusterModel.selectCluster(view: view)
        if let monument = getMonumentFrom(view: view),
            let pos = self.visibleMonuments.value.firstIndex(of: monument) {
            self.collectionView
                .scrollToItem(at: IndexPath(item: pos, section: 0),
                              at: .left,
                              animated: true)
        } else {
            print("Couldn't find monument")
        }
    }

    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        self.visibleMonuments.value = getVisibleMonuments(mapView: mapView)
    }

    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        self.visibleMonuments.value = getVisibleMonuments(mapView: mapView)
    }

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        self.visibleMonuments.value = getVisibleMonuments(mapView: mapView)
    }
    
}

