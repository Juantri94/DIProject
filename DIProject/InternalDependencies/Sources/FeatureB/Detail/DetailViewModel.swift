//
//  DetailViewModel.swift
//  FeatureB
//
//  Created by Juantri Jimenez on 22/7/22.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    private let eventTracker: FeatureBEventTracker

    init(
        eventTracker: FeatureBEventTracker
    ) {
        self.eventTracker = eventTracker
    }

    func trackOnAppear() {
        eventTracker.trackEvent(name: "OnAppear FeatureB")
    }
}
