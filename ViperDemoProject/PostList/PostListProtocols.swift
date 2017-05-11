//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol PostListViewProtocol: class {

    var presenter: PostListPresenterProtocol? { get set }

    func setNavInfo(title:String?)

    // PRESENTER -> VIEW
    func updatePosts(_ posts:[Post])
}

protocol PostListWireframeProtocol: class {

    func presentListInterfaceFromWindow(_ window: UIWindow)

    // PRESENTER -> WIREFRAME
    func showPostDetail(_ post:Post)

}

protocol PostListPresenterProtocol: class {
    var view: PostListViewProtocol? { get set }
    var interactor: PostListInteractorInputProtocol? { get set }
    var wireframe: PostListWireframeProtocol? { get set }

    // VIEW -> PRESENTER
    func getPosts()
    func selectedPost(_ post:Post)
}

protocol PostListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func postsLoaded()
}

protocol PostListInteractorInputProtocol: class {

    var presenter: PostListInteractorOutputProtocol? { get set }
    var posts : [Post] { get set }
    //PRESENTER -> INTERACTOR
    func loadAllData()
    func loadPosts()
    func loadUsers()
    func loadComments()
}

