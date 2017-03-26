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

class NearbyViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!

    var viewModel: NearbyViewModel!
    var viewModelConstructor: NearbyViewModelConstructorType!

    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = viewModelConstructor(self)

        mapView.delegate = self

        // Fetch the monuments
        viewModel.getMonuments().subscribe().addDisposableTo(disposeBag)

        viewModel
            .dataManager
            .monuments
            .asObservable()
            .bindTo(collectionView.rx.items) { (collectionView, row, element) in
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
                self.mapView.addAnnotations(monuments.map { MonumentAnnotation(monument: $0) })
        }).addDisposableTo(disposeBag)
    }
    
}

extension NearbyViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MonumentAnnotation {
            let identifier = "monumentPin"
            var annotationView: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                annotationView = dequeuedView
            } else {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            }

            annotationView.image = UIImage(named: "monumentAnnotation")
            annotationView.canShowCallout = true
            
            return annotationView
        }

        return nil
    }
}


