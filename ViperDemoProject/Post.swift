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
    dynamic var userId = 0
    dynamic var id = 0
    dynamic var title = ""
    dynamic var body = ""

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(obj: JSON) {
        self.init()
        self.id = obj["id"].intValue
        self.title = obj["title"].stringValue
        self.body = obj["body"].stringValue
        self.userId = obj["userId"].intValue
    }

    func getUser() -> User? {
        let user : User? = try! Realm().objects(User.self).filter("id = \(self.userId)").first
        return user
    }

    func getComments() -> [Comment] {
        let comments : [Comment] = try! Realm().objects(Comment.self).filter("postId = \(self.id)").toArray()
        return comments

    }

}
