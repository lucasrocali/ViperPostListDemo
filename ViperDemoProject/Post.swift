//
//  Post.swift
//  ViperDemoProject
//
//  Created by Lucas Rocali on 5/10/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Post: Object {
    dynamic var owner: User?
    dynamic var id = 0
    dynamic var title = ""
    dynamic var body = ""

    //var comments: [Comment] = LinkingObjects(fromType: Comment.self, property: "owner").toArray()

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
        self.title = obj["title"].stringValue
        self.body = obj["body"].stringValue
        self.owner = User(id: obj["userId"].intValue)
    }

}
