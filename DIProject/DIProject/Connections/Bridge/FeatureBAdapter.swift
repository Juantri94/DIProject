//
//  FeatureBAdapter.swift
//  DIProject
//
//  Created by Juantri Jimenez on 22/7/22.
//

import Foundation
import FeatureB
import Environment
import Bridge

extension BridgeConnections {
    
    var featureB: FeatureBProtocol {
        FeatureBEntryPoint(
            eventTracker: EventTrackerFeatureB(eventTracker: environment.eventTracker))
    }
    
}

// Feature B connections

private final class EventTrackerFeatureB: FeatureBEventTracker {
    
    private let eventTracker: EventTracker
    
    init(eventTracker: EventTracker) {
        self.eventTracker = eventTracker
    }

    func trackEvent(name: String) {
        eventTracker.logEvent(name, eventProperties: nil)
    }
}
