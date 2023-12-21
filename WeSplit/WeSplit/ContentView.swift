//
//  ContentView.swift
//  WeSplit
//
//  Created by Galih Samudra on 21/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello World Title!")
                }
                Section {
                    Text("Hello World Title!")
                    Text("Hello World!")
                    Text("Hello World!")
                    Text("Hello World!")
                }
                Section {
                    Text("Hello World!")
                    Text("Hello World!")
                    Text("Hello World!")
                    Text("Hello World!")
                    Text("Hello World!")
                    Text("Hello World!")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}
