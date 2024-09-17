//
//  NetworkManager.swift
//  CoinTracker
//
//  Created by Huseyin on 16/09/2024.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidResponse = "Invalid Response"
    case invalidData = "Invalid Data"
}

struct WebService: NetworkServiceProtocol {
    var type: String = "web"
    
    private func fetch<T: Decodable>(_ url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    func fetchCoins() async throws -> [Coin] {
        return try await fetch(Constants.URLs.allCoins)
    }
    
}

