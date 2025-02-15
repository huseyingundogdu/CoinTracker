//
//  Coin.swift
//  CoinTracker
//
//  Created by Huseyin on 16/09/2024.
//

import Foundation


struct Coin: Codable, Identifiable, Hashable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation, totalVolume: Int
    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double
    let marketCapChange24H, marketCapChangePercentage24H, circulatingSupply, totalSupply: Double
    let maxSupply: Double?
    let ath, athChangePercentage: Double
    let athDate: String
    let atl, atlChangePercentage: Double
    let atlDate: String
    let roi: Roi?
    let lastUpdated: String
    let sparklineIn7D: Sparkline7D
    let priceChangePercentage24HInCurrency: Double

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case roi
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
    }
}

// MARK: - Roi
struct Roi: Codable, Hashable {
    let times: Double
    let currency: Currency
    let percentage: Double
}

enum Currency: String, Codable, Hashable {
    case btc = "btc"
    case eth = "eth"
    case usd = "usd"
}

// MARK: - Sparkline7D

struct Sparkline7D: Codable, Hashable {
    let price: [Double]
}


struct ExtraInfo: Codable, Hashable {
    let hashingAlgorithm: String
    let description: Tion
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case hashingAlgorithm = "hashing_algorithm"
        case description
        case links
    }
}

struct Tion: Codable, Hashable {
    let en: String
}

struct Links: Codable, Hashable {
    let homepage: [String]
}
