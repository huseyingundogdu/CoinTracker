//
//  ContentView.swift
//  CoinTracker
//
//  Created by Huseyin on 11/09/2024.
//

import SwiftUI

struct ContentView: View {
    var coins: [Coin] = Constants.sampleCoins
    
    
    var body: some View {
        //CoinsView - List
        VStack {
            HStack {
                Text("Coins")
                Spacer()
                Text("Prices")
            }
            .padding()
            List {
                //CoinView - ForEach
                ForEach(coins) { coin in
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
        }
    }
}

#Preview {
    ContentView()
}
