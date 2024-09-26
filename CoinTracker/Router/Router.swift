//
//  Router.swift
//  CoinTracker
//
//  Created by Huseyin on 16/09/2024.
//

import Foundation
import SwiftUI

@Observable
class Router {
    var navPath = NavigationPath()
    
    public enum Destination: Codable, Hashable {
        case coinDetail(coin: Coin)
    }
    
    func navigate(_ destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateRoot() {
        navPath.removeLast(navPath.count)
    }
}
