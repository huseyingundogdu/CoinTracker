//
//  Double.swift
//  CoinTracker
//
//  Created by Huseyin on 19/09/2024.
//

import Foundation


extension Double {
    //2373.47
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var currencyFormatterText: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.decimalSeparator = "."
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var numberFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$.00"
    }
    
    func toPercent() -> String{
        guard let numberAsString = numberFormatter.string(for: self) else { return ""}
        return numberAsString + "%"
    }
    
    func toCurrencyText() -> String {
        let absoluteValue = abs(self)
        switch absoluteValue {
        case 1_000_000_000_000...:
            // Billion case
            let trillionValue = self / 1_000_000_000_000
            if let formattedNumber = currencyFormatterText.string(from: NSNumber(value: trillionValue)) {
                return formattedNumber + "Tn"
            }
        case 1_000_000_000...:
            // Billion case
            let billionValue = self / 1_000_000_000
            if let formattedNumber = currencyFormatterText.string(from: NSNumber(value: billionValue)) {
                return formattedNumber + "Bn"
            }
        case 1_000_000...:
            // Million case
            let millionValue = self / 1_000_000
            if let formattedNumber = currencyFormatterText.string(from: NSNumber(value: millionValue)) {
                return formattedNumber + "M"
            }
        case 1_000...:
            // Thousand case
            let thousandValue = self / 1_000
            if let formattedNumber = currencyFormatterText.string(from: NSNumber(value: thousandValue)) {
                return formattedNumber + "K"
            }
        default:
            // Less than 1,000, just return the currency formatted number
            return currencyFormatterText.string(from: NSNumber(value: self)) ?? "$0"
        }
        
        return "$0"
    }
}


extension Int {
    func toCurrencyText() -> String {
        // Convert Int to Double and reuse the same logic
        return Double(self).toCurrencyText()
    }
}
