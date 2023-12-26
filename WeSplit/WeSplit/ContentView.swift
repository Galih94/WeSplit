//
//  ContentView.swift
//  WeSplit
//
//  Created by Galih Samudra on 21/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkedAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [0, 10, 15, 20, 25]
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
                    .keyboardType(.decimalPad)
            }
            
            Section {
                Text("Result Tips:")
                Text(checkedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
            }
        }
    }
}

#Preview {
    ContentView()
}
