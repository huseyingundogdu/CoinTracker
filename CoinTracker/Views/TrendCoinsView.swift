//
//  TrendCoinsView.swift
//  CoinTracker
//
//  Created by Huseyin on 19/09/2024.
//

import SwiftUI

struct TrendCoinsView: View {
    
    let coins: [Coin]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(coins) { coin in
                    VStack {
                        AsyncImage(url: URL(string: coin.image), scale: 4)
                            .frame(width: 100, height: 100)
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundStyle(.gray.opacity(0.2))
                            }
                            
                        HStack {
                            Text(coin.symbol.uppercased())
                                .bold()
                            Spacer()
                            Text(coin.priceChangePercentage24H.toPercent())
                                .bold()
                                .foregroundStyle(.green)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TrendCoinsView(coins: Constants.sampleCoins)
}
