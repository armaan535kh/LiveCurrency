//
//  CurrencyModel.swift
//  LiveCurrency
//
//  Created by Armaan Khan  on 15/09/25.
//

import Foundation


struct Currency: Identifiable, Hashable{
    let id = UUID()
    let name: String
    let symbol: String
    let conversionRate: Double
    
    
}

let currencies = [
    Currency(name: "US Dollar", symbol: "USD", conversionRate: 1.0),
    Currency(name: "Euro", symbol: "EUR", conversionRate: 0.89),
    Currency(name: "Japanese Yen", symbol: "JPY", conversionRate: 130.0),
    Currency(name: "Indian Rupee", symbol: "INR", conversionRate: 74.0),
    
]
