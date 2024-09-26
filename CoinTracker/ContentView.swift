//
//  ContentView.swift
//  CoinTracker
//
//  Created by Huseyin on 11/09/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        @Bindable var router = router
        //CoinsView - List
        NavigationStack(path: $router.navPath) {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                VStack {
                    CoinListView()
                }
                .navigationTitle("Coin Tracker")
                .navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .coinDetail(let coin):
                        CoinDetailView(coin: coin)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(Router())
}
