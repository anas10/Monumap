//
//  FakeObjects.swift
//  Monumap
//
//  Created by Anas Ait Ali on 20/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Foundation

class FakeObjects {
    // THE GOAL OF THIS CLASS IS TO PROVIDE FAKE OBJECTS FOR EACH MODEL WHEN TESTING.
    // TO DO SO, CREATE AN EXTENSION FOR THIS CLASS WITH A STATIC FUNCTION THAT
    // RETURNS THE OBJECT YOU WANT TO FAKE (cf. Example below)
}


/*
// Example for struct Item
extension FakeObjects {
    class FakeItem {
        static func Item1() -> Item {
            return Item(id: "1f52caeb-389a-4623-9364-a766b8a2f973")
        }

        static func Item2() -> Item {
            return Item(id: "81ed9261-33d6-41ff-84b3-c28d3e5f3813")
        }
    }
}
*/

// Use like this : FakeObjects.FakeItem.Item1()
