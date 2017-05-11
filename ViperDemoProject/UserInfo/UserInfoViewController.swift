//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class UserInfoViewController: UIViewController, UserInfoViewProtocol,PopUpProtocol {

    var presenter: UserInfoPresenterProtocol?

    var popUpInfo : PopUpInfo?

    var user:User = User()

    override func viewDidLoad() {
        super.viewDidLoad()

        popUpInfo = PopUpInfo(popUpView: self.view, transitioningBackgroundView: UIView(), backgroundAlpha: 0.2, popupType: .center)

        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.didTapBackgroundView (_:)))
        popUpInfo?.transitioningBackgroundView.addGestureRecognizer(gesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func didTapBackgroundView(_ sender:UITapGestureRecognizer) {
         presenter?.closeView()
    }
}
