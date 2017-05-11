//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

protocol PostDetailViewProtocol: class {

    var presenter: PostDetailPresenterProtocol? { get set }

    func setNavInfo(title:String?,leftBtnText:String?,rightBtnText:String?)
    func leftBtnClicked(_ sender:UIBarButtonItem)
    func rightBtnClicked(_ sender:UIBarButtonItem)

    // PRESENTER -> VIEW
}

protocol PostDetailWireframeProtocol: class {

    func pushModule(fnavc:UINavigationController,post:Post)

    //var somePopupWireframe : SomePopupWireframe? { get set }

    //func presentSomePopupView(fpresenter : PostDetailPresenter)

    // PRESENTER -> WIREFRAME
    func back()

}

protocol PostDetailPresenterProtocol: class {
    var view: PostDetailViewProtocol? { get set }
    var interactor: PostDetailInteractorInputProtocol? { get set }
    var wireframe: PostDetailWireframeProtocol? { get set }

    func leftBtnClicked()
    func rightBtnClicked()

    // VIEW -> PRESENTER
}

protocol PostDetailInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
}

protocol PostDetailInteractorInputProtocol: class {

    var presenter: PostDetailInteractorOutputProtocol? { get set }

    var post : Post { get  set }

    //PRESENTER -> INTERACTOR
}
/*
protocol SomePopupDelegate {
    func someFunctionFromSomePopup()
}
*/
