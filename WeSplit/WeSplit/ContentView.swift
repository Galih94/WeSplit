//
//  ContentView.swift
//  WeSplit
//
//  Created by Galih Samudra on 21/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
