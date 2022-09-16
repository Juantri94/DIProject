//
//  File.swift
//  
//
//  Created by Juantri Jimenez on 27/7/22.
//

import Foundation

public protocol AppboyProtocol {
    func getDeviceId() -> String
    func logCustomEvent(_ eventName: String, withProperties properties: [AnyHashable: Any]?)
    func pushAuthorization(fromUserNotificationCenter: Bool)
    func registerDeviceToken(_ deviceToken: Data)
}

public struct AppboyTracker {

    private let appboy: AppboyProtocol?

    public init(appboy: AppboyProtocol?) {
        self.appboy = appboy
    }
    
    public func getDeviceId() -> String {
        print("\nDevice ID: \(String(describing: appboy?.getDeviceId()))\n")
        return appboy?.getDeviceId() ?? ""
    }

    public func logCustomEvent(_ eventName: String, withProperties properties: [AnyHashable: Any]?) {
        appboy?.logCustomEvent(eventName, withProperties: properties)
    }
}
