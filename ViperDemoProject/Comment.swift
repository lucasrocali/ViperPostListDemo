//
//  Comment.swift
//  ViperDemoProject
//
//  Created by Lucas Rocali on 5/10/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Comment: Object {
    dynamic var postId = 0
    dynamic var id = 0
    dynamic var name = ""
    dynamic var email = ""
    dynamic var body = ""

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(obj: JSON) {
        self.init()
        self.id = obj["id"].intValue
        self.name = obj["name"].stringValue
        self.email = obj["email"].stringValue
        self.body = obj["body"].stringValue
        self.postId = obj["postId"].intValue
    }

}
