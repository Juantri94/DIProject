//
//  AppEnvironmentSetup.swift
//  DIProject
//
//  Created by Juantri Jimenez on 22/7/22.
//

import UIKit
import Foundation
import Environment
import Appboy
import AmplitudeEventTracker

extension AppDelegate {

    static func liveEnvironment(
        application: UIApplication,
        launchOptions: [AnyHashable : Any]?
    ) -> AppEnvironment {
        let amplitudeApiKey = "" // from env
        let appboyApiKey = ""
        
        return AppEnvironment.init(
            apiClient: ApiClient.liveApiClient(
                url: "",
                defaultHeaders: [
                    "Accept":"application/json",
                    "Content-Type":"application/json"
                ]),
            localStorage: .live,
            eventTracker: .liveAmplitude(apiKey: amplitudeApiKey),
            appboyTracker: .liveAppboyKit(
                apiKey: appboyApiKey,
                application: application,
                launchOptions: launchOptions))
    }

    #if DEBUG
    static func mockEnvironment() -> AppEnvironment {
        AppEnvironment(
            apiClient: ApiClient.mockApiClient(),
            localStorage: .mock,
            eventTracker: .mockAmplitude(),
            appboyTracker: .mockAppboyKit())
    }
    #endif
}
