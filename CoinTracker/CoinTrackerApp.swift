//
//  CoinTrackerApp.swift
//  CoinTracker
//
//  Created by Huseyin on 11/09/2024.
//

import SwiftUI

@main
struct CoinTrackerApp: App {
    @State private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(router)
        }
    }
}
