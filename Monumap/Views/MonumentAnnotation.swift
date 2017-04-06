//
//  MonumentAnnotation.swift
//  Monumap
//
//  Created by Anas Ait Ali on 26/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
import MapKit

class MonumentAnnotation: NSObject, MKAnnotation {
    let monument: Monument
    let coordinate: CLLocationCoordinate2D
    let title: String?

    init(monument: Monument) {
        self.coordinate = CLLocationCoordinate2D(
            latitude: monument.latitude,
            longitude: monument.longitude
        )

        self.title = monument.site

        self.monument = monument
        
        super.init()
    }
}
