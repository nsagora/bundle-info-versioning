//
//  AppDelegate.swift
//  swift-ui-project
//
//  Created by Alex Cristea on 07/06/2020.
//  Copyright © 2020 Alex Cristea. All rights reserved.
//

import UIKit
import BundleInfoVersioning

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let bundleInfoVersioning = BundleInfoVersioning()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        bundleInfoVersioning.check(forKeyPath: "CFBundleShortVersionString") { (_ , newVersion: String?) in
            self.showWhatsNew(in: newVersion)
        }
        
        return true
    }
    
    private func showWhatsNew(in version: String?) {
        guard let version = version else { return }
        print("You've open the new \(version) verion of the app. This message will be shown only once for each new version of the app.")
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

