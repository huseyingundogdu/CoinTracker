//
//  TrendCoinsView.swift
//  CoinTracker
//
//  Created by Huseyin on 19/09/2024.
//

import SwiftUI

struct TrendCoinsView: View {
    
    var coins: [Coin]
    
    var trendCoins : [Coin] {
        coins.filter { $0.priceChangePercentage24H > 0 }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Trend Coins")
                .font(.title2)
                .bold()
                
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(trendCoins) { coin in
                        VStack(alignment: .center) {
                            AsyncImage(url: URL(string: coin.image)) { image in
                                image
                                    .resizable()
                                    .frame(width: 75, height: 75)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 125, height: 125)
                            }
                            
                            
                            
                            HStack {
                                Text(coin.symbol.uppercased())
                                    .bold()
                                    .font(.subheadline)
                                //Spacer()
                                Text(coin.priceChangePercentage24H.toPercent())
                                    .bold()
                                    .font(.subheadline)
                                    .foregroundStyle(.green)
                            }
                        }
                        .frame(width: 125, height: 125)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.gray.opacity(0.2))
                                .stroke(.gray, lineWidth: 2)
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 2)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TrendCoinsView(coins: Constants.sampleCoins)
}
