//
//  EventTracker.swift
//  Environment
//
//  Created by Juantri Jimenez on 21/7/22.
//

import Foundation

public protocol AmplitudeProtocol {
    func logEvent(_ eventType: String, withEventProperties eventProperties: [AnyHashable: Any]?)
}

public struct EventTracker {
    
    private let amplitude: AmplitudeProtocol
    private let baseParameters: [String:Any] = ["platform": "iOS"]

    public init(amplitude: AmplitudeProtocol) {
        self.amplitude = amplitude
    }

    public func logEvent(_ eventName: String, eventProperties: [AnyHashable: Any]?) {
        amplitude.logEvent(eventName, withEventProperties: eventProperties)
        print("Event name: \(eventName)")
    }

}
