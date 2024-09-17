//
//  CoinListViewModel.swift
//  CoinTracker
//
//  Created by Huseyin on 17/09/2024.
//

import Foundation


class CoinListViewModel: ObservableObject {
    
    private var service: NetworkServiceProtocol
    @Published var coins: [Coin] = [Coin]()
    
    
    func fetchCoins() async {
        do {
            coins = try await service.fetchCoins()
        } catch NetworkError.invalidURL {
            print("url")
        } catch NetworkError.invalidResponse {
            print("response")
        } catch NetworkError.invalidData {
            print("data")
        } catch {
            print("error")
        }
    }
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
}
