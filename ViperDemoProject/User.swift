//
//  User.swift
//  ViperDemoProject
//
//  Created by Lucas Rocali on 5/10/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class User: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var username = ""
    dynamic var email = ""
    dynamic var phone = ""
    dynamic var website = ""
    dynamic var lat = ""
    dynamic var lng = ""
    dynamic var companyName = ""

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(id: Int) {
        self.init()
        self.id = id
    }

    convenience init(obj: JSON) {
        self.init()
        self.id = obj["id"].intValue
        self.name = obj["name"].stringValue
        self.username = obj["username"].stringValue
        self.email = obj["email"].stringValue
        self.phone = obj["phone"].stringValue
        self.website = obj["website"].stringValue
        self.lat = obj["address"]["geo"]["lat"].stringValue
        self.lng = obj["address"]["geo"]["lng"].stringValue
        self.companyName = obj["company"]["name"].stringValue

    }
}
