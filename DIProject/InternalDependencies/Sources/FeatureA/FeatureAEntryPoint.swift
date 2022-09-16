//
//  FeatureAEntryPoint.swift
//  FeatureA
//
//  Created by Juantri Jimenez on 19/7/22.
//

import SwiftUI
import Bridge

public protocol FeatureAEventTracker {
    func trackEvent(name: String)
}

public protocol FeatureAApiClient {
    func getData(endpoint: String, params: [String:Any]?) async throws -> Data
}

public final class FeatureAEntryPoint: FeatureAProtocol {

    private let eventTracker: FeatureAEventTracker
    private let apiClient: FeatureAApiClient

    public init(
        eventTracker: FeatureAEventTracker,
        apiClient: FeatureAApiClient
    ) {
        self.eventTracker = eventTracker
        self.apiClient = apiClient
    }

    public func getInitialView() -> AnyView {
        let vm = MainViewModel(eventTracker: eventTracker, apiClient: apiClient)
        let view = MainView(viewModel: vm)
        return AnyView(view)
    }
}
