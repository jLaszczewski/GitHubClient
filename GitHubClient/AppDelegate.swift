//
//  AppDelegate.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import SwiftyBeaver
#if DEBUG
import DBDebugToolkit
#endif
import Fabric
import Crashlytics
import UIKit

let log = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    fileprivate var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        prepareWindowAndAppCoordinator()
        prepareApplication()

        return true
    }
}

// MARK: - Preparation
extension AppDelegate {
    fileprivate func prepareWindowAndAppCoordinator() {
        window = UIWindow()
        appCoordinator = AppCoordinator(presentation: .window(window: window!))
        appCoordinator.start()
    }
    
    fileprivate func prepareApplication() {
        Appearance.config()
        initSwiftyBeaver()
        initDebugToolkit()
        Fabric.with([Crashlytics.self])
    }

    private func initDebugToolkit() {
        #if DEBUG
            DBDebugToolkit.setup()
        #endif
    }
    
    private func initSwiftyBeaver() {
        #if DEBUG
            let console = ConsoleDestination()  // log to Xcode Console
            log.addDestination(console)
            log.info("SwiftyBeaver initialized")
        #endif
    }
}
