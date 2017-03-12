//
//  UIStoryboardExtensions.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func main() -> UIStoryboard {
        return UIStoryboard(name: StoryboardNames.Main.rawValue, bundle: nil)
    }

    func viewControllerWithID(_ identifier:ViewControllerStoryboardIdentifier) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier.rawValue)
    }
}
