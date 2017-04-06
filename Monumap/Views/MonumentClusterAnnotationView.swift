//
//  MonumentClusterAnnotationView.swift
//  Monumap
//
//  Created by Anas Ait Ali on 02/04/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import MapKit

class MonumentClusterAnnotationView: MKAnnotationView {

    var count: Int = 0 {
        didSet {
            countLabel.text = "\(count)"
            countLabel.alpha = count > 1 ? 1 : 0
            canShowCallout = count > 1 ? false : true
        }
    }

    fileprivate var countLabel: UILabel!

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.setupView()
    }

    func setupView() {
        self.image = UIImage(named: "monumentAnnotation")

        self.countLabel = UILabel(frame: self.bounds)
        countLabel.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        countLabel.textAlignment = NSTextAlignment.center
        countLabel.layer.backgroundColor = UIColor(red:0.99, green:0.40, blue:0.41, alpha:1.00).cgColor
        countLabel.layer.borderColor = UIColor(red:0.97, green:0.96, blue:0.94, alpha:1.00).cgColor
        countLabel.layer.borderWidth = 3
        countLabel.layer.cornerRadius = self.bounds.width / 2
        countLabel.textColor = UIColor.white
        countLabel.adjustsFontSizeToFitWidth = true
        countLabel.minimumScaleFactor = 2
        countLabel.numberOfLines = 1
        countLabel.font = UIFont.boldSystemFont(ofSize: 12)
        countLabel.baselineAdjustment = UIBaselineAdjustment.alignCenters
        countLabel.alpha = 0
        self.addSubview(countLabel)

        canShowCallout = true
    }

}
