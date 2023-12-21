//
//  ContentView.swift
//  WeSplit
//
//  Created by Galih Samudra on 21/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
    }
}

#Preview {
    ContentView()
}
