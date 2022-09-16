//
//  AppBoyConnection.swift
//  DIProject
//
//  Created by Juantri Jimenez on 27/7/22.
//

import Foundation
import AppboyKit
import Environment

extension Appboy: AppboyProtocol { }

public extension AppboyTracker {

    static func liveAppboyKit(
        apiKey: String,
        application: UIApplication,
        launchOptions: [AnyHashable : Any]?
    ) -> AppboyTracker {
//        Appboy.start(
//            withApiKey: apiKey,
//            in: application,
//            withLaunchOptions: launchOptions,
//            withAppboyOptions: nil)
        let appboy = Appboy.sharedInstance()
        return AppboyTracker(appboy: appboy)
    }

    #if DEBUG
    static func mockAppboyKit() -> AppboyTracker {
        AppboyTracker(appboy: nil)
    }
    #endif
}
