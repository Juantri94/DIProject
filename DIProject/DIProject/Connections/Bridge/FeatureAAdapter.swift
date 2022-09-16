//
//  FeatureAAdapter.swift
//  DIProject
//
//  Created by Juantri Jimenez on 21/7/22.
//

import Foundation
import FeatureA
import Bridge
import Environment

extension BridgeConnections {

    var featureA: FeatureAProtocol {
        FeatureAEntryPoint(
            eventTracker: EventTrackerFeatureA(eventTracker: environment.eventTracker),
            apiClient: ApiClientFeatureA(apiClient: environment.apiClient))
    }

}

// Feature A connections

private final class ApiClientFeatureA: FeatureAApiClient {

    private let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func getData(endpoint: String, params: [String : Any]?) async throws -> Data {
        try await apiClient.request(endpoint: endpoint, body: params, httpMethod: .GET)
    }
}

private final class EventTrackerFeatureA: FeatureAEventTracker {

    private let eventTracker: EventTracker

    init(eventTracker: EventTracker) {
        self.eventTracker = eventTracker
    }

    func trackEvent(name: String) {
        eventTracker.logEvent(name, eventProperties: nil)
    }
}
