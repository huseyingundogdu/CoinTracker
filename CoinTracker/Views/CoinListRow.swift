//
//  CoinListRow.swift
//  CoinTracker
//
//  Created by Huseyin on 19/09/2024.
//

import SwiftUI

struct CoinListRow: View {
    var coin: Coin
    
    var body: some View {
        HStack {
            Text(coin.marketCapRank.description)
                .font(.subheadline)
            
            AsyncImage(url: URL(string: coin.image), scale: 5)
                .frame(width: 50, height: 50)
            
            Text(coin.symbol.uppercased())
                .font(.title3)
                .bold()
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(coin.currentPrice.toCurrency())
                    .font(.headline)
                    .bold()
                
                Text(coin.priceChangePercentage24H.toPercent())
                    .font(.subheadline)
                    .foregroundStyle(coin.priceChange24H > 0 ? .green : .red)
            }
        }
    }
}

#Preview {
    CoinListRow(coin: Constants.sampleCoins[0])
}
