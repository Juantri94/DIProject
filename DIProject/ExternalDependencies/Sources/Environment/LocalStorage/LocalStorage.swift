//
//  LocalStorage.swift
//  Environment
//
//  Created by Juantri Jimenez on 21/7/22.
//

import Foundation

public struct LocalStorage {
    
    private let defaults: UserDefaults

    public init(defaults: UserDefaults) {
        self.defaults = defaults
    }

    public func store(key: String, payload: [Any]) {
        defaults.set(payload, forKey: key)
    }

    public func retrieve<T>(key: String) -> T? {
        defaults.value(forKey: key) as? T
    }

}

public extension LocalStorage {
    static let live: LocalStorage = Self.init(defaults: UserDefaults.standard)
}

#if DEBUG
public extension LocalStorage {
    static let mock: LocalStorage = Self.init(defaults: UserDefaults(suiteName: "mock")!)
}
#endif
