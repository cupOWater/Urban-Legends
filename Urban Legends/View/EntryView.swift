//
//  EntryView.swift
//  Urban Legends
//
//  Created by MacNCheese on 26/07/2023.
//

import SwiftUI

struct EntryView: View {
    var entry : UrbanEntry
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                MapView(coordinates: entry.sighting)
                    .frame(height: 250)
                ScrollView {
                    VStack {
                       
                    }
                }
            }
        }
        .navigationTitle(entry.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(entry: urbanEntries[0])
    }
}
