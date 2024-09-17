//
//  CoinListView.swift
//  CoinTracker
//
//  Created by Huseyin on 17/09/2024.
//

import SwiftUI

struct CoinListView: View {
    @StateObject private var vm = CoinListViewModel(service: LocalService())
    
    
    var body: some View {
        List {
            ForEach(vm.coins) { coin in
                HStack {
                    AsyncImage(url: URL(string: coin.image), scale: 5)
                        .frame(width: 50, height: 50)
                    
                    Text(coin.name)
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text(coin.currentPrice.description)
                        .padding(.vertical)
                }
            } 
        }
        .task {
            await vm.fetchCoins()
        }
    }
}

#Preview {
    CoinListView()
}
