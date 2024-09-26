//
//  CoinListView.swift
//  CoinTracker
//
//  Created by Huseyin on 17/09/2024.
//

import SwiftUI

struct CoinListView: View {
    @StateObject private var vm = CoinListViewModel(service: LocalService())
    @Environment(Router.self) private var router
    
    var coins: [Coin] {
        var coins = vm.coins
        if vm.isSortedByPrice {
            if vm.isSortedByPriceDesc {
                coins.sort { $0.currentPrice > $1.currentPrice }
            } else {
                coins.sort { $0.currentPrice < $1.currentPrice }
            }
        }
        
        if vm.isSortedByCoin {
            if vm.isSortedByCoinDesc {
                coins.sort { $0.marketCapRank > $1.marketCapRank }
            } else {
                coins.sort { $0.marketCapRank < $1.marketCapRank }
            }
        }
        return coins
    }
    
    
    @State var text = ""
    var body: some View {
        VStack(alignment: .leading) {
            
            //Trend Section
            TrendCoinsView(coins: vm.coins)
            
            Text("All Coins")
                .font(.title2)
                .bold()
                .padding(.horizontal)
            
            //Order Buttons
            HStack {
                Button {
                    vm.isSortedByPrice = false
                    vm.isSortedByCoin = true
                    vm.isSortedByCoinDesc.toggle()
                    print(vm.isSortedByCoinDesc)
                } label: {
                    CustomListSortButton(
                        isSorted: vm.isSortedByCoin,
                        isUp: vm.isSortedByCoinDesc,
                        title: "Coin")
                }
                Spacer()
                Button {
                    vm.isSortedByCoin = false
                    vm.isSortedByPrice = true
                    vm.isSortedByPriceDesc.toggle()
                } label: {
                    CustomListSortButton(
                        isSorted: vm.isSortedByPrice,
                        isUp: vm.isSortedByPriceDesc,
                        title: "Price")
                }
                Button("", systemImage: "arrow.clockwise") {
                    vm.refreshTheList()
                }
            }
            .padding(.horizontal)
            
            //All Coins List
            List {
                ForEach(coins) { coin in
                    CoinListRow(coin: coin)
                        .onTapGesture {
                            //Navigate to coin detail view
                            router.navigate(.coinDetail(coin: coin))
                        }
                }
            }
            .listStyle(.plain)
            .task {
                await vm.fetchCoins()
            }
        }
        .navigationTitle("Coin Tracker")
    }
}

#Preview {
    NavigationStack {
        CoinListView()
            .environment(Router())
    }
}
