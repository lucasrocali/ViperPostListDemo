//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON
import RealmSwift

class PostListInteractor: PostListInteractorInputProtocol {

    weak var presenter: PostListInteractorOutputProtocol?

    var posts : [Post]

    let realm = try! Realm()
    
    init() {
        posts = try! Realm().objects(Post.self).toArray()
    }

    func loadAllData() {
        if posts.count == 0 {
            loadUsers()
            loadComments()
        } else {
            self.presenter?.postsLoaded()
        }
    }

    func loadUsers() {
        firstly {
            DataManager.loadUsers()
            }.then { json -> Void in
                print(json)
                for obj in json.arrayValue {
                    print(obj)
                    let user = User(obj: obj)
                    try! self.realm.write {
                        self.realm.create(User.self, value: user, update: true)
                    }
                }
            }.always {
                self.loadPosts()
            }.catch { error in
                print (error)
        }
    }

    func loadPosts() {

        firstly {
            DataManager.loadPosts()
            }.then { json -> Void in
                print(json)
                for obj in json.arrayValue {
                    print(obj)
                    let post = Post(obj: obj)
                    try! self.realm.write {
                        self.realm.create(Post.self, value: post, update: true)
                    }
                    //self.posts.append(post)
                }
            }.always {
                self.posts = try! Realm().objects(Post.self).toArray()
                self.loadComments()
            }.catch { error in
                print (error)
        }
    }



    func loadComments() {
        firstly {
            DataManager.loadComments()
            }.then { json -> Void in
                print(json)
                for obj in json.arrayValue {
                    print(obj)
                    let comment = Comment(obj: obj)
                    try! self.realm.write {
                        self.realm.create(Comment.self, value: comment, update: true)
                    }
                }
            }.always {
                self.presenter?.postsLoaded()
            }.catch { error in
                print (error)
        }

    }
}
