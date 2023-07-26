//
//  ContentView.swift
//  Urban Legends
//
//  Created by MacNCheese on 24/07/2023.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
