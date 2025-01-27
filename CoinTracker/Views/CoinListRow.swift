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
            leftColumn
            Spacer()
            rightColumn
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinListRow(coin: Constants.sampleCoins[0])
}

extension CoinListRow {
    private var leftColumn: some View {
        HStack {
            Text(coin.marketCapRank.description)
                .font(.subheadline)
                .foregroundStyle(Color.secondary)
            
            AsyncImage(url: URL(string: coin.image), scale: 5)
                .frame(width: 50, height: 50)
            
            Text(coin.symbol.uppercased())
                .font(.title3)
                .bold()
                .foregroundStyle(Color.theme.textColor)
        }
    }
}

extension CoinListRow {
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.toCurrency())
                .font(.headline)
                .bold()
                .foregroundStyle(Color.theme.textColor)
            
            Text(coin.priceChangePercentage24H.toPercent())
                .font(.subheadline)
                .foregroundStyle(
                    coin.priceChange24H > 0 ?
                    Color.theme.green : Color.theme.red)
        }
    }
}
