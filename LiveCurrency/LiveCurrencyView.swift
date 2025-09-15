//
//  LiveCurrencyView.swift
//  LiveCurrency
//
//  Created by Armaan Khan  on 15/09/25.
//

import SwiftUI

struct LiveCurrencyView: View {
    
    @State private var amount: String = ""
    @State private var selectedFromCurrency = currencies[0]
    @State private var selectedToCurrency = currencies[1]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Amount to Convert")) {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("From")) {
                    Picker("From", selection: $selectedFromCurrency) {
                        ForEach(currencies) { currency in
                            Text(currency.name).tag(currency)
                        }
                    }
                    
                }
                
                Section(header: Text("TO")) {
                    Picker("To", selection: $selectedToCurrency) {
                        ForEach(currencies) { currency in
                            Text(currency.name).tag(currency)
                        }
                    }
                }
                
                Section(header: Text("Converted Amount")) {
                    Text("\(convertedAmount, specifier: "%.2f") \(selectedToCurrency.name)")
                }
                
                
                Button("Swap Currencies") {
                    let temp = selectedFromCurrency
                    selectedFromCurrency = selectedToCurrency
                    selectedToCurrency = temp
                }
                .buttonStyle(.bordered)
                .font(.title2)
                
            }
            .navigationTitle("Currency Convertor")
        }
        
    }
    
    private var convertedAmount: Double {
        guard let amountDouble = Double(amount) else {
            return 0
        }
        let inUSD = amountDouble / selectedFromCurrency.conversionRate
        return inUSD * selectedToCurrency.conversionRate
    }
}

#Preview {
    LiveCurrencyView()
}
