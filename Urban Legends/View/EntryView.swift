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
                    .frame(height: 290)
                    .overlay{
                        
                    }
                entry.image
                    .resizable()
                    .frame(width: 190, height: 190)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(
                        RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)))
                    .overlay{
                        RoundedRectangle(cornerSize: CGSize(width: 50, height: 50))
                            .stroke(style: StrokeStyle(lineWidth: 15))
                            .foregroundColor(Color("background"))
                    }
                    .offset(y: -50)
                    .padding(.bottom, -50)
                
                ScrollView{
                    VStack(alignment: .leading){
                        Text("TYPE")
                        Text("CLASSIFICATION")
                        Text("")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
        }
        .navigationTitle(entry.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(entry: urbanEntries[1])
    }
}
