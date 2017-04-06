//
//  MapViewClusterModel.swift
//  Monumap
//
//  Created by Anas Ait Ali on 02/04/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
import CCHMapClusterController
import RxSwift

class MapViewClusterModel: CCHMapClusterController {

    override init!(mapView: MKMapView!) {
        super.init(mapView: mapView)

        self.delegate = self
        self.marginFactor = 0.0
    }

    func viewFor(annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: MKAnnotationView?

        if let annotation = annotation as? CCHMapClusterAnnotation {
            let identifier = "monumentPin"
            var clusterAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MonumentClusterAnnotationView

            if let clusterAnnotationView = clusterAnnotationView {
                clusterAnnotationView.annotation = annotation
            } else {
                clusterAnnotationView = MonumentClusterAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            }

            clusterAnnotationView!.count = annotation.annotations.count
            annotationView = clusterAnnotationView
        }

        return annotationView
    }

    func selectCluster(view: MKAnnotationView) {
        if let clusterAnnotation = view.annotation as? CCHMapClusterAnnotation {
            if clusterAnnotation.annotations.count > 1 {
                let mapRect = clusterAnnotation.mapRect()
                let edgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
                mapView.setVisibleMapRect(mapRect, edgePadding: edgeInsets, animated: true)
            }
        }
    }

}

extension MapViewClusterModel: CCHMapClusterControllerDelegate {

    func mapClusterController(_ mapClusterController: CCHMapClusterController!, willReuse mapClusterAnnotation: CCHMapClusterAnnotation!) {
        let clusterAnnotationView = self.mapView.view(for: mapClusterAnnotation) as? MonumentClusterAnnotationView
        clusterAnnotationView?.count = mapClusterAnnotation.annotations.count
    }

    func mapClusterController(_ mapClusterController: CCHMapClusterController!, titleFor mapClusterAnnotation: CCHMapClusterAnnotation!) -> String! {
        var ret = ""
        if let monumentAnnotation = mapClusterAnnotation.annotations.first as? MonumentAnnotation {
            ret = monumentAnnotation.title ?? ""
        }
        return ret
    }

}
