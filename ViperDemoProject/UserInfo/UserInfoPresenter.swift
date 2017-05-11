//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class UserInfoPresenter: UserInfoPresenterProtocol {
    
    weak var view: UserInfoViewProtocol?
    var wireframe: UserInfoWireframeProtocol?
    
    init() {}

    func closeView() {
        wireframe?.dismissVC(view: view as! UIViewController)
    }
}
