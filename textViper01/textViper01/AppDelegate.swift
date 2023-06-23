//
//  AppDelegate.swift
//  textViper01
//
//  Created by Erinson Andres Romero Terry on 14/02/23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if window != nil {
            HomeRouter.setRoot(navigationController: HomeAssembly.navigationController())
        }
        return true
    }
}


