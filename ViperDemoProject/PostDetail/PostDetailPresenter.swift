//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class PostDetailPresenter: PostDetailPresenterProtocol, PostDetailInteractorOutputProtocol {
    
    weak var view: PostDetailViewProtocol? {
        didSet {
            if let view = view {
                view.setNavInfo(title: "Post Detail", leftBtnText: "Voltar",rightBtnText: "")

            }
        }
    }

    var interactor: PostDetailInteractorInputProtocol?
    var wireframe: PostDetailWireframeProtocol?

    init() {}

    func leftBtnClicked() {
        wireframe?.back()
    }

    func rightBtnClicked() {
        //
    }

}
