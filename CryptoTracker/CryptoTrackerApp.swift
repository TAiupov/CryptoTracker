//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Tagir Aiupov on 2021-05-31.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
