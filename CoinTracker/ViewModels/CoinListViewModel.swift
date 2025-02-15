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
    @Published var isSortedByCoin: Bool = false
    @Published var isSortedByPrice: Bool = false
    @Published var isSortedByCoinDesc: Bool = false
    @Published var isSortedByPriceDesc: Bool = false
    
    
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
    
    func refreshTheList() {
        isSortedByCoin = false
        isSortedByPrice = false
    }
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
}
