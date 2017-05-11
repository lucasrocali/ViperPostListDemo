//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

protocol UserDetailViewProtocol: class {

    var presenter: UserDetailPresenterProtocol? { get set }

    func setNavInfo(title:String?,leftBtnText:String?,rightBtnText:String?)
    func leftBtnClicked(_ sender:UIBarButtonItem)
    func rightBtnClicked(_ sender:UIBarButtonItem)

    // PRESENTER -> VIEW
}

protocol UserDetailWireframeProtocol: class {

    func pushModule(fnavc:UINavigationController)

    //var somePopupWireframe : SomePopupWireframe? { get set }

    //func presentSomePopupView(fpresenter : UserDetailPresenter)

    // PRESENTER -> WIREFRAME

}

protocol UserDetailPresenterProtocol: class {
    var view: UserDetailViewProtocol? { get set }
    var interactor: UserDetailInteractorInputProtocol? { get set }
    var wireframe: UserDetailWireframeProtocol? { get set }

    func leftBtnClicked()
    func rightBtnClicked()

    // VIEW -> PRESENTER
}

protocol UserDetailInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
}

protocol UserDetailInteractorInputProtocol: class {

    var presenter: UserDetailInteractorOutputProtocol? { get set }

    //PRESENTER -> INTERACTOR
}
/*
protocol SomePopupDelegate {
    func someFunctionFromSomePopup()
}
*/
