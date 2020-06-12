//
//  AppDelegate.swift
//  swift-ui-project
//
//  Created by Alex Cristea on 07/06/2020.
//  Copyright © 2020 Alex Cristea. All rights reserved.
//

import UIKit
import BundleInfoVersioning

struct Util {
    
    static func showWhatsNew(in version: String?) {
        guard let version = version else { return }
        print("You've updated the app to version \(version). Checkout what's new ...")
    }
    
    static func migrateDatabase() {
        print("New database version detected. Database migration in progress.")
    }
}

struct Analytics {
    static func install(version: String?) {
        guard let version = version else { return }
        print("You've installed the bundle verion \(version).")
    }
    
    static func update(from: String?, to: String?) {
        guard let from = from else { return }
        guard let to = to else { return }
        print("You've updated from bundle verion \(from) to bundle verion \(to).")
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let bundleInfoVersioning = BundleInfoVersioning()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        bundleInfoVersioning.check(forKeyPath: "CFBundleShortVersionString") { (_ , newVersion: String?) in
            Util.showWhatsNew(in: newVersion)
        }
        
        bundleInfoVersioning.check(forKeyPath: "CFBundleVersion") { (old: String?, new: String?) in
            if old == nil {
                Analytics.install(version: new)
            }
            else {
                Analytics.update(from: old, to: new)
            }
        }
        
        bundleInfoVersioning.check(forKeyPath: "NSAgora/DatabaseVersion") { (_: Int?, _: Int?) in
            Util.migrateDatabase()
        }
        
        return true
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

