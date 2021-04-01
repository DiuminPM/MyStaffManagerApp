//
//  AppDelegate.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 14.03.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            window?.rootViewController = AutorizationVC()
            FirebaseApp.configure()
            
            return true

        }

   

}

