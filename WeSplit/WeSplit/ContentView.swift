//
//  ContentView.swift
//  WeSplit
//
//  Created by Galih Samudra on 21/12/23.
//

import SwiftUI

struct ContentView: View {
    let dorms = ["Hufflepuff", "Griffindor", "Ravenclaw", "Slytherin"]
    @State private var selectedDorms = ""
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your dorms", selection: $selectedDorms) {
                    ForEach(dorms, id: \.self) {
                        Text($0)
                    }
                }
            }.navigationTitle("DORMS")
        }
    }
}

#Preview {
    ContentView()
}
