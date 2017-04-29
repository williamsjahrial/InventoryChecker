//
//  InventoryItem.swift
//  InventoryChecker
//
//  Created by William Sjahrial on 4/29/17.
//  Copyright © 2017 Mirai Apps. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct InventoryItem {
    
    let sku: String
    let name: String
    let ref: FIRDatabaseReference?
    var count: Int
    
    init(sku: String, name: String, count: Int = 10) {
        self.sku = sku
        self.name = name
        self.count = count
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        sku = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        count = snapshotValue["count"] as! Int
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "sku" : sku,
            "name" : name,
            "count" : count
        ]
    }
    
}
