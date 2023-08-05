//
//  EntryRow.swift
//  Urban Legends
//
//  Created by MacNCheese on 25/07/2023.
//

import SwiftUI

struct CustomShapeBack : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY * 0.1))
        path.addLine(to: CGPoint(x: rect.maxX * 0.03, y: rect.maxY * 0.1))
        path.addLine(to: CGPoint(x: rect.maxX * 0.05, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX * 0.10, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX * 0.12, y: rect.maxY * 0.1))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.1))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        return path
    }
}

struct CustomShapeFront : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX * 0.98, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        return path
    }
}

struct EntryRow: View {
    var entry : UrbanEntry
    var body: some View {
        CustomShapeFront()
            .overlay{
                CustomShapeFront()
                    .stroke(style: StrokeStyle(lineWidth: 2))
                    .foregroundColor(Color("f_back"))
                HStack{
                    Image(entry.images[0].name)
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
            .frame(width: 360, height: 82)
            .foregroundColor(Color("f_front"))
            .background{
                ZStack{
                    CustomShapeBack()
                        .frame(width: 340, height: 110)
                        .foregroundColor(Color("f_back"))
                        .position(x: 170, y: 25)

                    Rectangle()
                        .overlay{
                            Rectangle()
                                .stroke(style: StrokeStyle(lineWidth: 2))
                                .foregroundColor(Color("f_back"))
                        }
                        .frame(width: 300, height: 90)
                        .foregroundColor(Color("f_front"))
                        .position(x: 170, y: 35)
                        
                }
            }.padding(.top, 30)
    
    }
}

struct EntryRow_Previews: PreviewProvider {
    static var previews: some View {
        EntryRow(entry : urbanEntries[0])
    }
}
