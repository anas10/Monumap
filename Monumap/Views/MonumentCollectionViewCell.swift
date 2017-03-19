//
//  MonumentCollectionViewCell.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

class MonumentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var site: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var dateInscribed: UILabel!

    func configure(monument: Monument) {
        self.site.text = monument.site
        self.location.text = monument.location
        self.dateInscribed.text = monument.dateInscribed
    }
}
