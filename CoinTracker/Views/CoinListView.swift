//
//  CoinListView.swift
//  CoinTracker
//
//  Created by Huseyin on 17/09/2024.
//

import SwiftUI

struct CoinListView: View {
    @StateObject private var vm = CoinListViewModel(service: LocalService())
    
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
            
            Text("Trend Coins")
                .font(.title2)
                .bold()
                .padding(.horizontal)
            TrendCoinsView(coins: vm.coins)
                .padding()
            
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
    }
}

//extension CoinListView {
//    var trendSection: some View {
//        VStack(alignment: .leading) {
//            Text("24h Trends")
//                .font(.title2)
//                .bold()
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack {
//                    ForEach(trendCoins) { coin in
//                        VStack {
//                            AsyncImage(url: URL(string: coin.image), scale: 4)
//                                .frame(width: 100, height: 100)
//                                .background {
//                                    RoundedRectangle(cornerRadius: 12)
//                                        .foregroundStyle(.gray.opacity(0.2))
//                                }
//                            
//                            HStack {
//                                Text(coin.symbol.uppercased())
//                                    .bold()
//                                Spacer()
//                                Text(coin.priceChangePercentage24H.toPercent())
//                                    .bold()
//                                    .foregroundStyle(.green)
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
