//
//  AppDelegate.swift
//  ViperDemoProject
//
//  Created by Lucas Rocali on 5/9/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var postListWireframe : PostListWireframe?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        postListWireframe = PostListWireframe()
        postListWireframe?.presentListInterfaceFromWindow(window!)
        return true
    }

}

