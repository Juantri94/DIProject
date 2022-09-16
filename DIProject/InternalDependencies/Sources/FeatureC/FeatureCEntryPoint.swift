//
//  FeatureCEntryPoint.swift
//  FeatureC
//
//  Created by Juantri Jimenez on 22/7/22.
//

import SwiftUI
import Bridge

public final class FeatureCEntryPoint: FeatureCProtocol {
    
    public init() { }

    public func getShareView() -> AnyView {
        return AnyView(ShareView())
    }
}
