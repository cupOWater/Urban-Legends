//
//  MainScreen.swift
//  Urban Legends
//
//  Created by MacNCheese on 24/07/2023.
//

import SwiftUI

struct MainScreen: View {
    @Binding var onMain : Bool
    @State var showAlert = false
    
    var body: some View {
        ZStack{
            // Background image
            Image("main_bg")
                .resizable()
                .brightness(-0.07)
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                // Logo
                Image("logo")
                    .resizable()
                    .frame(width: 295, height: 295.0)
                    .aspectRatio(contentMode: .fit)
                
                // Title
                VStack{
                    Text("Urban Legends")
                        .foregroundColor(Color("component"))
                        .font(.custom("Courier", size: 40))
                    Text("and where to find them")
                        .foregroundColor(Color("component"))
                        .font(.custom("Courier", size: 32))
                        .multilineTextAlignment(.center)
                        .padding([.leading, .trailing])
                    
                }
                .padding()
                .background(.white)
                .padding()
                .border(Color(.white), width: 3)

                // Slogan
                Text("'Cause life needs a bit of mystery")
                    .italic()
                    .font(.subheadline)
                    .foregroundColor(.white)
                Spacer()
                
                // Start button
                Button(action: {
                    withAnimation{
                        onMain = false
                    }
                }, label: {
                    ZStack{
                        Capsule(style: .continuous)
                            .fill(Color("component"))
                            .frame(width: 245, height: 85)
                        Capsule(style: .continuous)
                            .stroke(Color(.white), lineWidth: 3)
                            .frame(width: 245, height: 85)
                        Text("START")
                            .font(.custom("Courier", size: 32))
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                }).padding()
                
                // Info button
                Button(action: {
                }, label: {
                    
                })
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                            showAlert = true
                    }, label: {
                        Image(systemName: "info.circle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 45, height: 45)
                    }).padding(.trailing, 45)
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Student Info"),
                          message: Text("Name: Huynh Ky Thanh \nID: s3884734\nProgram: IT"),
                          dismissButton: .default(Text("Dismiss")))
                }
                
            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(onMain: .constant(true))
    }
}
