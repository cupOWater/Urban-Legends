//
//  RowData.swift
//  Urban Legends
//
//  Created by MacNCheese on 26/07/2023.
//

import SwiftUI

struct RowData: View {
    var entry : UrbanEntry
    var body: some View {
        HStack{
            entry.image
                .resizable()
                .frame(width: 70, height: 70)
                .scaledToFill()
                .overlay{
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [1]))
                        .foregroundColor(.black)
                }
                .padding(.leading)
            VStack (alignment: .leading){
                Text("Name: \(entry.name)")
                    .padding(.vertical, 0.15)
                Text("Type: \(entry.type)")
                    .padding(.vertical, 0.15)
                Text("Class: \(entry.classification)")
                    .padding(.vertical, 0.15)
            }
            .font(.custom("Courier", size: 16))
            .fontWeight(.bold)
            .foregroundColor(Color("f_back"))
            
            Spacer()
        }
    }
}

struct RowData_Previews: PreviewProvider {
    static var previews: some View {
        RowData(entry: urbanEntries[0])
    }
}
