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
            
            VStack (alignment: .leading){
                MapView(coordinates: entry.sighting)
                    .frame(height: 290)
                entry.image
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(
                        RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)))
                    .overlay{
                        RoundedRectangle(cornerSize: CGSize(width: 50, height: 50))
                            .stroke(style: StrokeStyle(lineWidth: 10))
                            .foregroundColor(Color("background"))
                    }
                    .offset(y: -100)
                    .padding(.horizontal, 5)
                    .padding(.bottom, -100)
                
                ScrollView{
                    VStack(alignment: .leading){
                        TextField(topic: "TYPE", content: entry.type, isInline: true)
                            .padding(.vertical, 3)
                        TextField(topic: "CLASS", content: entry.classification, isInline: true)
                            .padding(.vertical, 3)
                        TextField(topic: "LOCATION", content: entry.location, isInline: true)
                            .padding(.vertical, 3)
                        TextField(topic: "DESCRIPTION", content: entry.description, isInline: false)
                            .padding(.vertical, 3)
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

struct TextField : View{
    let topic : String
    let content : String
    let isInline : Bool
    
    var body : some View {
        if isInline{
            HStack (alignment: .top){
                Text(topic + ":")
                    .font(.custom("Courier", size: 20))
                    .bold()
                    .underline()
                
                Text(content)
                    .font(.custom("Courier", size: 20))
            }
        }else {
            VStack(alignment: .leading){
                Text(topic + ":")
                    .font(.custom("Courier", size: 20))
                    .bold()
                    .underline()
                
                Text(content)
                    .font(.custom("Courier", size: 16))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
            }
        }
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(entry: urbanEntries[0])
    }
}
