//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import RealmSwift

class PostListPresenter: PostListPresenterProtocol, PostListInteractorOutputProtocol {
    
    weak var view: PostListViewProtocol? {
        didSet {
            if let view = view {
                view.setNavInfo(title: "Post List")

            }
        }
    }

    var interactor: PostListInteractorInputProtocol?
    var wireframe: PostListWireframeProtocol?

    init() {}

    func getPosts() {
        interactor?.loadAllData()    }

    func postsLoaded() {
        print("postsLoaded")
        view?.updatePosts((interactor?.posts)!)
    }

}
