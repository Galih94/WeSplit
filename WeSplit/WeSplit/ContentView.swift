//
//  ContentView.swift
//  WeSplit
//
//  Created by Galih Samudra on 21/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkedAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    @FocusState private var amountIsFocused: Bool
    
    let MIN_NUM_PEOPLE = 2
    var totalPerPerson: Double {
        let percentageSelected = Double(tipPercentage)
        let peopleCount = Double(numberOfPeople + MIN_NUM_PEOPLE)
        
        let tipValue = (checkedAmount / 100.0 * percentageSelected)
        let grandTotal = checkedAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var total: Double {
        let percentageSelected = Double(tipPercentage)
        let tipValue = (checkedAmount / 100.0 * percentageSelected)
        let grandTotal = checkedAmount + tipValue
        return grandTotal
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
                        ForEach(0..<101) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
                }
                
                Section("Total Amount") {
                    Text(total, format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
                        .foregroundStyle( tipPercentage == 0 ? .red : .primary )
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
