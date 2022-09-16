//
//  MainView.swift
//  FeatureA
//
//  Created by Juantri Jimenez on 19/7/22.
//

import SwiftUI
import Bridge
import UIComponents

struct MainView: View {

    @ObservedObject private var viewModel: MainViewModel
    @State var isLinkActive = false
    private let featureB: FeatureBProtocol

    init(
        viewModel: MainViewModel,
        featureB: FeatureBProtocol = Bridge.shared.featureB
    ) {
        self.viewModel = viewModel
        self.featureB = featureB
    }

    var body: some View {
        VStack {
            CommonButton(action: {
                viewModel.loadData()
            }, text: "Load data")
            .onAppear {
                viewModel.trackOnAppear()
            }
            .padding()
            
            NavigationLink(isActive: $isLinkActive) {
                featureB.getDetailView()
            } label: {
                Button {
                    isLinkActive.toggle()
                } label: {
                    Text("Open detail")
                }
                .padding()
            }
        }
    }
}

#if DEBUG
struct EventTrackerMock: FeatureAEventTracker {
    func trackEvent(name: String) {}
}
struct ApiClientMock: FeatureAApiClient {
    func getData(endpoint: String, params: [String : Any]?) -> Data {
        Data()
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(eventTracker: EventTrackerMock(), apiClient: ApiClientMock()))
    }
}
#endif
