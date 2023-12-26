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
    @FocusState private var amountIsFocused: Bool
    
    let MIN_NUM_PEOPLE = 2
    let tipPercentages = [0, 10, 15, 20, 25]
    var totalPerPerson: Double {
        let percentageSelected = Double(tipPercentage)
        let peopleCount = Double(numberOfPeople + MIN_NUM_PEOPLE)
        
        let tipValue = (checkedAmount / 100.0 * percentageSelected)
        let grandTotal = checkedAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Amount after tips:") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
                }
            }
            .navigationTitle("WeSPlit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
