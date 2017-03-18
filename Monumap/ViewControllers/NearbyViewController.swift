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

class NearbyViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let items = Observable.just([1, 2, 3])

        items
            .bindTo(collectionView.rx.items) { (collectionView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "siteCellIdentifier", for: indexPath)
                return cell
            }
            .disposed(by: disposeBag)
    }
    
}
