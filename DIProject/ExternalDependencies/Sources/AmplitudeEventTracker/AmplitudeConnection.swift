//
//  AmplitudeEventTracker.swift
//  AmplitudeEventTracker
//
//  Created by Juantri Jimenez on 19/7/22.
//

import Foundation
import Amplitude
import Environment

extension Amplitude: AmplitudeProtocol { }

public extension EventTracker {

    static func liveAmplitude(apiKey: String) -> EventTracker {
        // Enable sending automatic session events
        Amplitude.instance().trackingSessionEvents = true
        // Initialize SDK
        Amplitude.instance().initializeApiKey(apiKey)
        // Set userId
        Amplitude.instance().setUserId("userId")
        // Log an event
        Amplitude.instance().logEvent("app_start")
        return EventTracker(amplitude: Amplitude.instance())
    }

    #if DEBUG
    static func mockAmplitude() -> EventTracker {
        EventTracker(amplitude: AmplitudeMock())
    }
    
    private final class AmplitudeMock: AmplitudeProtocol {
        func logEvent(_ eventType: String, withEventProperties eventProperties: [AnyHashable: Any]?) {
            print("Mock tracker - Event name: \(eventType)")
        }
    }
    #endif
}
