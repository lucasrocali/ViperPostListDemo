//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation

class UserDetailPresenter: UserDetailPresenterProtocol, UserDetailInteractorOutputProtocol {
    
    weak var view: UserDetailViewProtocol? {
        didSet {
            if let view = view {
                view.setNavInfo(title: "", leftBtnText: "",rightBtnText: "")

            }
        }
    }

    var interactor: UserDetailInteractorInputProtocol?
    var wireframe: UserDetailWireframeProtocol?
    
    init() {}

    func leftBtnClicked() {
       // navigationWireframe?.back()
    }

    func rightBtnClicked() {
       // navigationWireframe?.next()
    }

}
