//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

protocol UserInfoViewProtocol: class {
    var presenter: UserInfoPresenterProtocol? { get set }
    // PRESENTER -> VIEW
    var user:User {get set}
}

protocol UserInfoWireframeProtocol: class {
    func presentModule(fview: UIViewController,user:User)
    func dismissVC(view:UIViewController)
     //PRESENTER -> WIREFRAME
}

protocol UserInfoPresenterProtocol: class {
    var view: UserInfoViewProtocol? { get set }
    var wireframe: UserInfoWireframeProtocol? { get set }
    // View -> Presenter
    func closeView()
}
