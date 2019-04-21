//
//  Counts.swift
//  Memory
//
//  Created by Александ on 20/04/2019.
//  Copyright © 2019 Максим Витовицкий. All rights reserved.
//

import UIKit
import RealmSwift

class Counts: Object {
    @objc dynamic var counts: Int = 0
    
    
    convenience init(counts: Int) {
        self.init()
        
        self.counts = counts
        
    }
}
