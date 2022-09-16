//
//  AppEnvironment.swift
//  Environment
//
//  Created by Juantri Jimenez on 21/7/22.
//

import Foundation

public struct AppEnvironment {

    public let apiClient: ApiClient
    public let localStorage: LocalStorage
    public let eventTracker: EventTracker
    public let appboyTracker: AppboyTracker?

    public init(
        apiClient: ApiClient,
        localStorage: LocalStorage,
        eventTracker: EventTracker,
        appboyTracker: AppboyTracker?
    ) {
        self.apiClient = apiClient
        self.localStorage = localStorage
        self.eventTracker = eventTracker
        self.appboyTracker = appboyTracker
    }
}
