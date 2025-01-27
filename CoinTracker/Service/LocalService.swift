//
//  LocalService.swift
//  CoinTracker
//
//  Created by Huseyin on 17/09/2024.
//

import Foundation


struct LocalService: NetworkServiceProtocol {
    var type: String = "local"
    
    private func fetch<T: Decodable>(_ resource: String) async throws -> T {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            print("path error")
            fatalError("path")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("data error")
            print("data error2")
            print(error.localizedDescription)
            fatalError("data")
        }
    }
    
    func fetchCoins() async throws -> [Coin] {
        return try await fetch(Constants.Paths.allCoins)
    }
    
    func fetchExtraInfo() async throws -> ExtraInfo {
        return try await fetch(Constants.Paths.chart)
    }
}
