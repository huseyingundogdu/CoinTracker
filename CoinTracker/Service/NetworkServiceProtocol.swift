//
//  NetworkServiceProtocol.swift
//  CoinTracker
//
//  Created by Huseyin on 17/09/2024.
//

import Foundation


protocol NetworkServiceProtocol {
    var type: String { get }
    func fetchCoins() async throws -> [Coin]
}
