//
//  ContentView.swift
//  Urban Legends
//
//  Created by MacNCheese on 24/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State var onMain = true
    var body: some View {
        if(onMain){
            MainScreen(onMain: $onMain)
                .transition(.asymmetric(insertion: .push(from: .leading), removal: .push(from: .trailing)))
        }else{
            ListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
