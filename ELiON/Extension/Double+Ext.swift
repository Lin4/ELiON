//
//  Double+Ext.swift
//  iCoin
//
//  Created by Lingeswaran Kandasamy on 12/15/21.
//

import Foundation

extension Double {
    
    private var currencyFormat2: NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 2
        return formater
    }
    
    
    func doubleToCurrencyWith2Decimal() -> String {
        let number = NSNumber(value: self)
        return currencyFormat2.string(from: number) ?? "0.00"
        
    }
    
    
    private var currencyFormat6: NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 6
        return formater
    }
    
    
    func doubleToCurrencyWith6Decimal() -> String {
        let number = NSNumber(value: self)
        return currencyFormat6.string(from: number) ?? "0.00"
        
    }
    
    
    func doubleToString() -> String {
        return String(format: "%.2f", self)
    }
    
    
    func asPercentString() -> String {
        return doubleToString() + "%"
    }
    
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.doubleToString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.doubleToString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.doubleToString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.doubleToString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.doubleToString()

        default:
            return "\(sign)\(self)"
        }
    }

    
}

