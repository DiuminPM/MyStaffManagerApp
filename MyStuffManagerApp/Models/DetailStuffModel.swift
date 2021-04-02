//
//  DetailStuffModel.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 16.03.2021.
//

import UIKit
import Firebase

struct Stuff {
    var name: String
    var price: String?
    var serialNumber: String?
    var location: String?
    var image: String?
    let userId: String
    var ref: DatabaseReference?
    
    init(name: String, price: String?, serialNumber: String?, location: String?, image: String?, userId: String) {
        self.name = name
        self.price = price
        self.serialNumber = serialNumber
        self.location = location
        self.image = image
        self.userId = userId
        self.ref = nil
    }
    
    init(snapShot:DataSnapshot) {
        let snapShotValue = snapShot.value as! [String : AnyObject]
        name = snapShotValue["name"] as! String
        price = snapShotValue["price"] as? String
        serialNumber = snapShotValue["serialNumber"] as? String
        location = snapShotValue["location"] as? String
        image = snapShotValue["image"] as? String
        userId = snapShotValue["userId"] as! String
        ref = snapShot.ref
    }
    
    func convertToDictionary() -> Any {
        return [
            "name": name,
            "price": price!,
            "serialNumber": serialNumber!,
            "location": location!,
            "image": image!,
            "userId": userId
        ]
    }
}

var stuffs = [Stuff]()

//var staffs = ["Name stuff", "Price", "Serial number", "Location"]


