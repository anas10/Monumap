//
//  Helpers.swift
//  Monumap
//
//  Created by Anas Ait Ali on 02/04/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
import MapKit
import CCHMapClusterController

func getMonumentFrom(view: MKAnnotationView) -> Monument? {
    if let clusterAnnotation = view.annotation as? CCHMapClusterAnnotation {
        if clusterAnnotation.annotations.count == 1 {
            return (clusterAnnotation.annotations.first as? MonumentAnnotation)?.monument
        }
    }
    return nil
}
