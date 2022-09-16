//
//  Bridge.swift
//  Bridge
//
//  Created by Juantri Jimenez on 21/7/22.
//

import SwiftUI

public final class Bridge {

    public static var shared: Bridge = Bridge()

    private var _featureA: (() -> FeatureAProtocol)?
    private var _featureB: (() -> FeatureBProtocol)?
    private var _featureC: (() -> FeatureCProtocol)?

    public internal(set) lazy var featureA = unwrap(_featureA)
    public internal(set) lazy var featureB = unwrap(_featureB)
    public internal(set) lazy var featureC = unwrap(_featureC)

    private init() { }

    public static func setUp(
        featureA: @autoclosure @escaping () -> FeatureAProtocol,
        featureB: @autoclosure @escaping () -> FeatureBProtocol,
        featureC: @autoclosure @escaping () -> FeatureCProtocol
    ) {
        shared._featureA = featureA
        shared._featureB = featureB
        shared._featureC = featureC
    }
}

private func unwrap<T>(_ storedOptionalClosure: (() -> T)?) -> T {
    if let storedClosure = storedOptionalClosure { return storedClosure() }

    fatalError("Bridge not set up with \(T.self)")
}
