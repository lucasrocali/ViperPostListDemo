//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class PostListWireframe: PostListWireframeProtocol {

    let PostListViewControllerIdentifier = "PostListTableViewController"

    var postDetailWireframe : PostDetailWireframe?
    var navigationController : UINavigationController?

    func presentListInterfaceFromWindow(_ window: UIWindow) {
        //MODULE COMPONENTS
        let view: PostListViewProtocol = getPostListViewController()
        let presenter: PostListPresenterProtocol & PostListInteractorOutputProtocol = PostListPresenter()
        let interactor: PostListInteractorInputProtocol = PostListInteractor()

        postDetailWireframe = PostDetailWireframe()

        //CONNECTING
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        showRootViewController(view as! UIViewController, inWindow: window)
    }


    func getPostListViewController() -> PostListTableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let PostListVC: PostListTableViewController = storyboard.instantiateViewController(withIdentifier: PostListViewControllerIdentifier) as! PostListTableViewController
        return PostListVC
    }

    func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow) {
        navigationController = navigationControllerFromWindow(inWindow)
        navigationController?.viewControllers = [viewController]
    }

    func navigationControllerFromWindow(_ window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }

    func showPostDetail(_ post:Post) {
        if let navVC = self.navigationController {
            postDetailWireframe?.pushModule(fnavc: navVC,post:post)
        }
    }
}
