//
//  NavigationWireframe.swift
//  ViperDemoProject
//
//  Created by Lucas Rocali on 5/9/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit

class NavigationWireframe {

    //Singleton
    fileprivate struct Static {
        static var instance: NavigationWireframe?
    }
    class var sharedInstance: NavigationWireframe {
        if (Static.instance == nil) {
            Static.instance = NavigationWireframe()

        }
        return Static.instance!
    }

    var postListWireframe : PostListWireframe
    var postDetailWireframe : PostDetailWireframe
    var userDetailWireframe : UserDetailWireframe


    init() {

        postListWireframe = PostListWireframe()
        postDetailWireframe = PostDetailWireframe()
        userDetailWireframe = UserDetailWireframe()


    }

    func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow) {
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController.viewControllers = [viewController]
    }

    func navigationControllerFromWindow(_ window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }   
    
}

