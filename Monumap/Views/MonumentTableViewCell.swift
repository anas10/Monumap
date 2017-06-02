//
//  MonumentTableViewCell.swift
//  Monumap
//
//  Created by Anas Ait Ali on 16/05/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

class MonumentTableViewCell: UITableViewCell {

    @IBOutlet weak var monumentImageView: UIImageView!
    @IBOutlet weak var siteLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.setup()
    }

    func setup() {
        self.monumentImageView.layer.masksToBounds = true
        self.monumentImageView.layer.cornerRadius = 3
    }

    func configure(monument: Monument) {
        self.siteLabel.text = monument.site
        self.countryLabel.text = monument.states
    }

}
