//
//  Constants.swift
//  CoinTracker
//
//  Created by Huseyin on 16/09/2024.
//

import Foundation


struct Constants {
    
    struct Paths {
        static let allCoins = "coins"
    }
    
    struct URLs {
        static let allCoins = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&price_change_percentage=24h" + apiKey
        static let apiKey = "&CG-an8SMezuirzishqGRsfBwrdp"
    }
    
    static let sampleCoins = [
        Coin(
            id: "bitcoin",
            symbol: "btc",
            name: "Bitcoin",
            image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
            currentPrice: 57928,
            marketCap: 1144352698030,
            marketCapRank: 1,
            fullyDilutedValuation: 1216478274181,
            totalVolume: 28467622077,
            high24H: 60364,
            low24H: 57572,
            priceChange24H: -2335.0125444204095,
            priceChangePercentage24H: -3.87473,
            marketCapChange24H: -45851215504.927734,
            marketCapChangePercentage24H: -3.85238,
            circulatingSupply: 19754900,
            totalSupply: 21000000,
            maxSupply: 21000000,
            ath: 73738,
            athChangePercentage: -21.47738,
            athDate: "2024-03-14T07:10:36.635Z",
            atl: 67.81,
            atlChangePercentage: 85288.30983,
            atlDate: "2013-07-06T00:00:00.000Z",
            roi: nil,
            lastUpdated: "2024-09-16T15:30:53.392Z",
            priceChangePercentage24HInCurrency: -3.8747280562837383
        ),
        Coin(
            id: "ethereum",
            symbol: "eth",
            name: "Ethereum",
            image: "https://coin-images.coingecko.com/coins/images/279/large/ethereum.png?1696501628",
            currentPrice: 2288.77,
            marketCap: 276306360814,
            marketCapRank: 2,
            fullyDilutedValuation: 276306360814,
            totalVolume: 17049526829,
            high24H: 2412.85,
            low24H: 2261.25,
            priceChange24H: -120.40257302214559,
            priceChangePercentage24H: -4.99767,
            marketCapChange24H: -13613458285.838013,
            marketCapChangePercentage24H: -4.69559,
            circulatingSupply: 120339716.024521,
            totalSupply: 120339716.024521,
            maxSupply: nil,
            ath: 4878.26,
            athChangePercentage: -53.08845,
            athDate: "2021-11-10T14:24:19.604Z",
            atl: 0.432979,
            atlChangePercentage: 528440.29703,
            atlDate: "2015-10-20T00:00:00.000Z",
            roi: Roi(times: 51.88926414418058, currency: Currency.btc, percentage: 5188.926414418058),
            lastUpdated: "2024-09-16T15:38:52.489Z",
            priceChangePercentage24HInCurrency: -4.997671891186334
        ),
        Coin(
            id: "tether",
            symbol: "usdt",
            name: "Tether",
            image: "https://coin-images.coingecko.com/coins/images/325/large/Tether.png?1696501661",
            currentPrice: 0.998896,
            marketCap: 118622969581,
            marketCapRank: 3,
            fullyDilutedValuation: 118622969581,
            totalVolume: 42665643818,
            high24H: 1.002,
            low24H: 0.995385,
            priceChange24H: -0.001364973936822445,
            priceChangePercentage24H: -0.13646,
            marketCapChange24H: -199109196.24049377,
            marketCapChangePercentage24H: -0.16757,
            circulatingSupply: 118785164536.894,
            totalSupply: 118785164536.894,
            maxSupply: nil,
            ath: 1.32,
            athChangePercentage: -24.36417,
            athDate: "2018-07-24T00:00:00.000Z",
            atl: 0.572521,
            atlChangePercentage: 74.79431,
            atlDate: "2015-03-02T00:00:00.000Z",
            roi: nil,
            lastUpdated: "2024-09-16T15:38:57.126Z",
            priceChangePercentage24HInCurrency: -0.1364617338786677
        ),
        Coin(
            id: "binancecoin",
            symbol: "bnb",
            name: "BNB",
            image: "https://coin-images.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1696501970",
            currentPrice: 537.64,
            marketCap: 78497564971,
            marketCapRank: 4,
            fullyDilutedValuation: 78497564971,
            totalVolume: 1214347507,
            high24H: 562.12,
            low24H: 538.58,
            priceChange24H: -22.11441697825262,
            priceChangePercentage24H: -3.95073,
            marketCapChange24H: -3138090538.9203033,
            marketCapChangePercentage24H: -3.84402,
            circulatingSupply: 145887575.79,
            totalSupply: 145887575.79,
            maxSupply: 200000000,
            ath: 717.48,
            athChangePercentage: -24.72671,
            athDate: "2024-06-06T14:10:59.816Z",
            atl: 0.0398177,
            atlChangePercentage: 1356249.83927,
            atlDate: "2017-10-19T00:00:00.000Z",
            roi: nil,
            lastUpdated: "2024-09-16T15:38:58.167Z",
            priceChangePercentage24HInCurrency: -3.950733972031787
        ),
        Coin(
            id: "solana",
            symbol: "sol",
            name: "Solana",
            image: "https://coin-images.coingecko.com/coins/images/4128/large/solana.png?1718769756",
            currentPrice: 131.19,
            marketCap: 61417243448,
            marketCapRank: 5,
            fullyDilutedValuation: 76682984117,
            totalVolume: 2321752119,
            high24H: 135.89,
            low24H: 129.68,
            priceChange24H: -4.433624648392936,
            priceChangePercentage24H: -3.26908,
            marketCapChange24H: -2044041355.808136,
            marketCapChangePercentage24H: -3.22093,
            circulatingSupply: 468226122.223653,
            totalSupply: 584607420.944015,
            maxSupply: nil,
            ath: 259.96,
            athChangePercentage: -49.55484,
            athDate: "2021-11-06T21:54:35.825Z",
            atl: 0.500801,
            atlChangePercentage: 26085.41208,
            atlDate: "2020-05-11T19:35:23.449Z",
            roi: nil,
            lastUpdated: "2024-09-16T15:38:56.361Z",
            priceChangePercentage24HInCurrency: -3.269081575532872
        )
    ]

}
