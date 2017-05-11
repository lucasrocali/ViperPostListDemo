//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class PostDetailWireframe: PostDetailWireframeProtocol {

    let PostDetailViewControllerIdentifier = "PostDetailViewController"

    //var somePopupWireframe : SomePopupWireframe?
    
    func pushModule(fnavc:UINavigationController) {
        //MODULE COMPONENTS
        let view: PostDetailViewProtocol = getPostDetailViewController()
        let presenter: PostDetailPresenterProtocol & PostDetailInteractorOutputProtocol = PostDetailPresenter()
        let interactor: PostDetailInteractorInputProtocol = PostDetailInteractor()

        //POPUPWIREFRAMES

        //let somePopupWireframe = SomePopupWireFrame()

        //CONNECTING
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        let PostDetailVC = view as! UIViewController
        fnavc.pushViewController(PostDetailVC, animated: true)
        
    }

    func getPostDetailViewController() -> PostDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let PostDetailVC: PostDetailViewController = storyboard.instantiateViewController(withIdentifier: PostDetailViewControllerIdentifier) as! PostDetailViewController
        return PostDetailVC
    }

    /*
     func presentSomePopupView(fpresenter : PostDetailPresenter) {
         somePopupWireframe?.presentSomePopupModule(fpresenter: fpresenter)
     }
     */


}
