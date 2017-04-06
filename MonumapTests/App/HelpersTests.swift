//
//  HelpersTests.swift
//  Monumap
//
//  Created by Anas Ait Ali on 08/04/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Quick
import Nimble
import MapKit
import CCHMapClusterController

@testable import Monumap

class HelpersTests: QuickSpec {
    
    override func spec() {
        describe("getMonumentFrom") {
            var annotationView: MKAnnotationView!
            var monument: Monument!

            context("when annotation is CCHMapClusterAnnotation") {
                beforeEach {
                    monument = FakeObjects.FakeMonument.Monument1()
                    let monumentAnnotation = MonumentAnnotation(monument: monument)
                    let clusterAnnotation = CCHMapClusterAnnotation()
                    _ = clusterAnnotation.annotations = Set([monumentAnnotation])
                    annotationView = MKAnnotationView(annotation: clusterAnnotation, reuseIdentifier: nil)

                }

                it("can get a monument from a clusterannotation") {
                    let subject = getMonumentFrom(view: annotationView)

                    expect(subject) == monument
                }

                context("when there is more than one annotation") {
                    beforeEach {
                        (annotationView.annotation
                            as? CCHMapClusterAnnotation)?
                            .annotations = Set([
                                MonumentAnnotation(monument: monument),
                                MonumentAnnotation(monument: monument)
                                ])
                    }

                    it("returns nil") {
                        let subject = getMonumentFrom(view: annotationView)

                        expect(subject).to(beNil())
                    }
                }
            }

            context("when annotation is not CCHMapClusterAnnotation") {
                beforeEach {
                    annotationView = MKAnnotationView(
                        annotation: MonumentAnnotation(monument: monument),
                        reuseIdentifier: nil)
                }

                it("returns nil") {
                    let subject = getMonumentFrom(view: annotationView)

                    expect(subject).to(beNil())
                }
            }
        }
    }
    
}
