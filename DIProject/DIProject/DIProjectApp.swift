//
//  DIProjectApp.swift
//  DIProject
//
//  Created by Juantri Jimenez on 19/7/22.
//

import SwiftUI

@main
struct DIProjectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            appDelegate.appFeature.initApp()
        }
    }
}
