//
//  FeatureBEntryPoint.swift
//  FeatureB
//
//  Created by Juantri Jimenez on 22/7/22.
//

import SwiftUI
import Bridge

public protocol FeatureBEventTracker {
    func trackEvent(name: String)
}

public final class FeatureBEntryPoint: FeatureBProtocol {
    
    private let eventTracker: FeatureBEventTracker

    public init(
        eventTracker: FeatureBEventTracker
    ) {
        self.eventTracker = eventTracker
    }

    public func getDetailView() -> AnyView {
        let vm = DetailViewModel(eventTracker: eventTracker)
        let view = DetailView(viewModel: vm)
        return AnyView(view)
    }
}
