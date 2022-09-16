//
//  AppDelegate.swift
//  DIProject
//
//  Created by Juantri Jimenez on 28/7/22.
//

import UIKit
import Environment

final class AppDelegate: NSObject, UIApplicationDelegate {

    private(set) var appFeature: AppFeature!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {

        let env = self.setupEnvironment(
            application: application,
            launchOptions: launchOptions)
        self.appFeature = AppFeature(appEnvironment: env)
        
        return true
    }

}

private extension AppDelegate {

    func setupEnvironment(
        application: UIApplication,
        launchOptions: [UIApplication.LaunchOptionsKey : Any]?
    ) -> AppEnvironment {
//        Self.mockEnvironment()
        Self.liveEnvironment(
            application: application,
            launchOptions: launchOptions)
    }

}

