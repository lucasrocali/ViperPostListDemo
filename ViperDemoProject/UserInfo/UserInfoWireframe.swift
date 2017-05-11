//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class UserInfoWireframe: NSObject,UserInfoWireframeProtocol,UIViewControllerTransitioningDelegate {

    let UserInfoViewControllerIdentifier = "UserInfoViewController"
    func presentModule(fview: UIViewController,user:User) {
        // Generating module components
        let view: UserInfoViewProtocol = getUserInfoViewController()
        let presenter: UserInfoPresenterProtocol = UserInfoPresenter()

        // Connecting
        view.presenter = presenter
        view.user = user
        presenter.view = view
        presenter.wireframe = self

        let UserInfoVC = view as! UserInfoViewController
        UserInfoVC.modalPresentationStyle = .custom
        UserInfoVC.transitioningDelegate = self
        UserInfoVC.view.frame = CGRect(x: 0, y: 0, width: fview.view.bounds.size.width*0.8, height: fview.view.bounds.size.height*0.8)

        fview.present(UserInfoVC, animated: true, completion: nil)

    }

    func getUserInfoViewController() -> UserInfoViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let UserInfoVC: UserInfoViewController = storyboard.instantiateViewController(withIdentifier: UserInfoViewControllerIdentifier) as! UserInfoViewController
        return UserInfoVC
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PopUpDismissalTransaction()
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PopUpPresentationTransaction()
    }

    func dismissVC(view:UIViewController) {
        view.dismiss(animated: true, completion: nil)
    }
}
