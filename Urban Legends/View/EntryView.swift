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
                MapView(coordinates: entry.sighting, zoomLevel: entry.mapZoom)
                    .frame(height: 280)
                ScrollView{
                    VStack(alignment: .leading){
                        TabView{
                            ForEach(entry.images, id: \.self){image in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.black)
                                    
                                    VStack {
                                        Image(image.name)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 230)
                                        
                                        Text(image.src)
                                            .font(.caption2)
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(height: 300)
                        TextField(topic: "TYPE", content: entry.type, isInline: true)
                            .padding(.vertical, 3)
                        TextField(topic: "CLASS", content: entry.classification, isInline: true)
                            .padding(.vertical, 3)
                        TextField(topic: "LOCATION", content: entry.location, isInline: true)
                            .padding(.vertical, 3)
                        TextField(topic: "DESCRIPTION", content: entry.description, isInline: false)
                            .padding(.vertical, 3)
                        Spacer()
                        Text(entry.src)
                            .font(.caption)
                            .italic()
                            .padding(.all, 10)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
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
                    .padding(.bottom, 3)
                
                Text(content)
                    .font(.custom("Courier", size: 16))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 5)
            }
        }
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(entry: urbanEntries[0])
    }
}
