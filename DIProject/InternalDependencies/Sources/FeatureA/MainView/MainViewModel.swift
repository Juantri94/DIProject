//
//  MainViewModel.swift
//  FeatureA
//
//  Created by Juantri Jimenez on 19/7/22.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    
    private let eventTracker: FeatureAEventTracker
    private let apiClient: FeatureAApiClient

    init(
        eventTracker: FeatureAEventTracker,
        apiClient: FeatureAApiClient
    ) {
        self.eventTracker = eventTracker
        self.apiClient = apiClient
    }

    func loadData() {
        Task {
            let _ = try? await apiClient.getData(endpoint: "www.featureA.com/getData", params: nil)
        }
    }

    func trackOnAppear() {
        eventTracker.trackEvent(name: "OnAppear FeatureA")
    }
}
