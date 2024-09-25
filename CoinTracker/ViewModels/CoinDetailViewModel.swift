//
//  CoinDetailViewModel.swift
//  CoinTracker
//
//  Created by Huseyin on 17/09/2024.
//

import Foundation


class CoinDetailViewModel: ObservableObject {
    private var service: NetworkServiceProtocol
    @Published var extraInfo: ExtraInfo?
    
    private func fetchExtraInfo() async throws {
        extraInfo = try await service.fetchExtraInfo()
    }
    
    init(service: NetworkServiceProtocol) {
        self.service = service
        Task {
            try await fetchExtraInfo()
        }
    }
}
