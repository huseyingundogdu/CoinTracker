//
//  CoinDetailView.swift
//  CoinTracker
//
//  Created by Huseyin on 17/09/2024.
//

import SwiftUI
import Charts

struct CoinDetailView: View {
    @StateObject private var vm = CoinDetailViewModel(service: LocalService())
    let coin: Coin
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                chartView
                    .frame(height: 200)
//                Rectangle()
//                    .frame(height: 200)
                
                Text("Overview")
                    .font(.title)
                    .bold()
                
                // TODO: Add readmore button to text
                Text(Constants.Placeholder.longText)
                    .lineLimit(5)
                
                Divider()
                
                VStack(spacing: 20) {
                    HStack {
                        
                        DetailViewInfoCard(
                            title: "Current Price",
                            value: coin.currentPrice.toCurrency(),
                            percentage: coin.priceChangePercentage24H
                        )
                        
                        DetailViewInfoCard(
                            title: "Market Capitalization",
                            value: coin.marketCap.toCurrencyText(),
                            percentage: coin.marketCapChangePercentage24H
                        )
                        
                    }
                    
                    HStack {
                        DetailViewInfoCard(
                            title: "Rank",
                            value: coin.marketCapRank.description
                        )
                        Spacer()
                        DetailViewInfoCard(
                            title: "Volume",
                            value: coin.totalVolume.toCurrencyText()
                        )
                        Spacer()
                    }
                }
                
                
                Text("Additional Details")
                    .font(.title)
                    .bold()
                
                VStack(spacing: 20) {
                    HStack {
                        DetailViewInfoCard(
                            title: "24h High",
                            value: coin.high24H.toCurrency()
                            )
                        Spacer()
                        DetailViewInfoCard(
                            title: "24h Low",
                            value: coin.low24H.toCurrency()
                        )
                        Spacer()
                    }
                    HStack {
                        DetailViewInfoCard(
                            title: "24h Price Change",
                            value: coin.priceChange24H.toCurrency(),
                            percentage: coin.priceChangePercentage24H)
                        Spacer()
                        DetailViewInfoCard(
                            title: "24h Market Cap Change",
                            value: coin.marketCapChange24H.toCurrencyText(),
                            percentage: coin.marketCapChangePercentage24H)
                        Spacer()
                    }
//                    HStack {
//                        Text("block time")
//                        Text("hashing algorithm")
//                    }
                }
                if let extraInfo = vm.extraInfo {
                    Button(extraInfo.links.homepage[0] ) {}
                }
            }
        }
        .navigationTitle(coin.name)
        .scrollIndicators(.hidden)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Text(coin.symbol.uppercased())
                    AsyncImage(url: URL(string: coin.image), scale: 7)
                }
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        CoinDetailView(coin: Constants.sampleCoins[0])
            .environment(Router())
    }
}

struct DetailViewInfoCard: View {
    let title: String
    let value: String
    var percentage: Double?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(value)
                .font(.title3)
                .bold()
            
            if let change = percentage {
                HStack {
                    Image(systemName: change > 0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    Text(change.toPercent())
                }
                .foregroundStyle(change > 0 ? .green : .red)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

extension CoinDetailView {
    var chartView: some View {
        VStack {
            Chart {
                ForEach(Array(coin.sparklineIn7D.price.enumerated()), id: \.element) { i, price in
                    LineMark(
                        x: .value("X", i),
                        y: .value("Y", price)
                    )
                }
            }
            .chartYScale(domain: [
                coin.sparklineIn7D.price.sorted { $0 < $1 }.first ?? 0,
                coin.sparklineIn7D.price.sorted { $0 > $1 }.first ?? 0
            ])
            .chartYAxisLabel(coin.sparklineIn7D.price.sorted { $0 < $1 }.first?.description ?? "0", position: .bottom)
            .chartYAxisLabel(coin.sparklineIn7D.price.sorted { $0 > $1 }.first?.description ?? "0", position: .top)
            .chartXAxis(.hidden)
            
        }
    }
}
