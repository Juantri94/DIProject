//
//  AppFeature.swift
//  DIProject
//
//  Created by Juantri Jimenez on 21/7/22.
//

import SwiftUI

import Environment
import Bridge

struct AppFeature {

    private let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
        _ = BridgeConnections(appEnvironment: appEnvironment)
    }

    func initApp() -> AnyView {
        AnyView(navView)
    }
    
    var navView: some View {
        NavigationView {
            Bridge.shared.featureA.getInitialView()
        }
    }
}
