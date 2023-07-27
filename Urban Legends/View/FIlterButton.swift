//
//  FIlterButton.swift
//  Urban Legends
//
//  Created by MacNCheese on 27/07/2023.
//

import SwiftUI

struct FIlterButton: View {
    
    @Binding var labelFor : Bool
    let btnLabel : String
    @State var btnOpacity : CGFloat = 1
    var body: some View {
        Button {
            labelFor.toggle()
            if(labelFor){
                btnOpacity = 1
            }else {
                btnOpacity = 0.5
            }
        } label: {
            Rectangle()
                .foregroundColor(Color("f_front"))
                .overlay{
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 3))
                        .foregroundColor(Color("f_back"))
                    Text(btnLabel)
                        .font(.custom("Courier", size: 20))
                        .foregroundColor(Color("f_back"))
                }.opacity(btnOpacity)
        }
        
    }
}

struct FIlterButton_Previews: PreviewProvider {
    static var previews: some View {
        FIlterButton(labelFor: .constant(true), btnLabel: "BOI")
    }
}
