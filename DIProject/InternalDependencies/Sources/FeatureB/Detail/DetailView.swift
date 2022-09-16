//
//  DetailView.swift
//  FeatureB
//
//  Created by Juantri Jimenez on 21/7/22.
//

import SwiftUI
import Bridge

struct DetailView: View {
    
    @ObservedObject private var viewModel: DetailViewModel
    private let featureC: FeatureCProtocol

    init(
        viewModel: DetailViewModel,
        featureC: FeatureCProtocol = Bridge.shared.featureC
    ) {
        self.viewModel = viewModel
        self.featureC = featureC
    }

    var body: some View {
        VStack {
            Text("Detail view")
                .padding()
                .onAppear {
                    viewModel.trackOnAppear()
                }
            
            featureC.getShareView()
        }
    }
}

#if DEBUG
struct EventTrackerMock: FeatureBEventTracker {
    func trackEvent(name: String) {}
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(eventTracker: EventTrackerMock()))
    }
}
#endif
