//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class PostDetailWireframe: PostDetailWireframeProtocol {

    let PostDetailViewControllerIdentifier = "PostDetailViewController"

    var navigationController : UINavigationController?

    var userInfoPopUpWireframe : UserInfoWireframe?
    
    func pushModule(fnavc:UINavigationController,post:Post) {
        //MODULE COMPONENTS
        let view: PostDetailViewProtocol = getPostDetailViewController()
        let presenter: PostDetailPresenterProtocol & PostDetailInteractorOutputProtocol = PostDetailPresenter()
        let interactor: PostDetailInteractorInputProtocol = PostDetailInteractor()

        //POPUPWIREFRAMES

        userInfoPopUpWireframe = UserInfoWireframe()

        //CONNECTING
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.post = post

        navigationController = fnavc

        let PostDetailVC = view as! UIViewController
        fnavc.pushViewController(PostDetailVC, animated: true)
        
    }

    func getPostDetailViewController() -> PostDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let PostDetailVC: PostDetailViewController = storyboard.instantiateViewController(withIdentifier: PostDetailViewControllerIdentifier) as! PostDetailViewController
        return PostDetailVC
    }

    func back() {
        navigationController?.popViewController(animated: true)
    }


    func presentUserInfo(fview : UIViewController,user:User) {
        userInfoPopUpWireframe?.presentModule(fview: fview,user:user)
     }



}
