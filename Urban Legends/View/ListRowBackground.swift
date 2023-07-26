//
//  ListRowBackground.swift
//  Urban Legends
//
//  Created by MacNCheese on 25/07/2023.
//

import SwiftUI

struct ListRowBackground: View {
    var body: some View {
        
        Rectangle()
            .frame(width: 360, height: 100)
            .foregroundColor(Color("f_front"))
            .background{
                ZStack{
                    Rectangle()
                        .frame(width: 350, height: 90)
                        .foregroundColor(Color("f_back"))
                        .position(x: 175, y: 20)

                    Rectangle()
                        .frame(width: 320, height: 90)
                        .foregroundColor(.white)
                        .position(x: 175, y: 30)
                        .shadow(radius: 5)
                        .transition(.offset(x : 175, y : 0))
                }
            }
    }
}

struct ListRowBackground_Previews: PreviewProvider {
    static var previews: some View {
        ListRowBackground()
    }
}
