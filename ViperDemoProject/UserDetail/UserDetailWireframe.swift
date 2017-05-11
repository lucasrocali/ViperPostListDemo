//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class UserDetailWireframe: UserDetailWireframeProtocol {

    let UserDetailViewControllerIdentifier = "UserDetailViewController"

    //var somePopupWireframe : SomePopupWireframe?
    
    func pushModule(fnavc:UINavigationController) {
        //MODULE COMPONENTS
        let view: UserDetailViewProtocol = getUserDetailViewController()
        let presenter: UserDetailPresenterProtocol & UserDetailInteractorOutputProtocol = UserDetailPresenter()
        let interactor: UserDetailInteractorInputProtocol = UserDetailInteractor()

        //POPUPWIREFRAMES

        //let somePopupWireframe = SomePopupWireFrame()

        //CONNECTING
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        let UserDetailVC = view as! UIViewController
        fnavc.pushViewController(UserDetailVC, animated: true)
        
    }

    func getUserDetailViewController() -> UserDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let UserDetailVC: UserDetailViewController = storyboard.instantiateViewController(withIdentifier: UserDetailViewControllerIdentifier) as! UserDetailViewController
        return UserDetailVC
    }

    /*
     func presentSomePopupView(fpresenter : UserDetailPresenter) {
         somePopupWireframe?.presentSomePopupModule(fpresenter: fpresenter)
     }
     */


}
