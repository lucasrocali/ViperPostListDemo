//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation

class PostDetailPresenter: PostDetailPresenterProtocol, PostDetailInteractorOutputProtocol {
    
    weak var view: PostDetailViewProtocol? {
        didSet {
            if let view = view {
                view.setNavInfo(title: "", leftBtnText: "",rightBtnText: "")

            }
        }
    }

    var interactor: PostDetailInteractorInputProtocol?
    var wireframe: PostDetailWireframeProtocol?
    //var navigationWireframe : NavigationWireframe?

    init() {}

    func leftBtnClicked() {
        //navigationWireframe?.back()
    }

    func rightBtnClicked() {
        //navigationWireframe?.next(inf)
    }

}
