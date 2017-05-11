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
        loadComments()
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
                        self.realm.create(User.self, value: post.owner!, update: true)
                    }
                    //self.posts.append(post)
                }
            }.always {
                self.posts = try! Realm().objects(Post.self).toArray()
                self.presenter?.postsLoaded()
            }.catch { error in
                print (error)
        }
    }

    func loadUsers() {
        firstly {
            DataManager.loadPosts()
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
                let users = try! Realm().objects(User.self).toArray()
                self.loadUsers()
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
                let comments = try! Realm().objects(Comment.self).toArray()
                self.loadPosts()
            }.catch { error in
                print (error)
        }

    }
}