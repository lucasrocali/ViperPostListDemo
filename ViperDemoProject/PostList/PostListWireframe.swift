//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class PostListWireframe: PostListWireframeProtocol {

    let PostListViewControllerIdentifier = "PostListTableViewController"

    var navigationWireframe : NavigationWireframe?

    func presentListInterfaceFromWindow(_ window: UIWindow) {
        //MODULE COMPONENTS
        let view: PostListViewProtocol = getPostListViewController()
        let presenter: PostListPresenterProtocol & PostListInteractorOutputProtocol = PostListPresenter()
        let interactor: PostListInteractorInputProtocol = PostListInteractor()

        navigationWireframe = NavigationWireframe()
        //POPUPWIREFRAMES

        //let somePopupWireframe = SomePopupWireFrame()

        //CONNECTING
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        navigationWireframe?.showRootViewController(view as! UIViewController, inWindow: window)
    }


    func getPostListViewController() -> PostListTableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let PostListVC: PostListTableViewController = storyboard.instantiateViewController(withIdentifier: PostListViewControllerIdentifier) as! PostListTableViewController
        return PostListVC
    }
}
