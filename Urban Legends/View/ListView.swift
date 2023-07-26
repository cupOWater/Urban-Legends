//
//  ListView.swift
//  Urban Legends
//
//  Created by MacNCheese on 24/07/2023.
//

import SwiftUI

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }

}

struct ListView: View {
    @State private var darkMode : Bool = false
    @State private var scheme: ColorScheme = .light
    @State private var darkModeImg = "sun.max"
    @State private var searchText = ""
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Courier", size: 40)!]
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Courier", size: 30)!]


    }
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack {
                        ForEach(urbanEntries){ entry in
                            NavigationLink(
                                destination: {
                                    EntryView(entry: entry)
                                },
                                label: {
                                    EntryRow(entry: entry)
                                        .padding(.vertical, 5)
                                }
                            )
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("CASE FILES")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        darkMode.toggle()
                        if(darkMode){
                            scheme = .dark
                            darkModeImg = "moon"
                        }else {
                            scheme = .light
                            darkModeImg = "sun.max"
                        }
                    }, label: {
                        Image(systemName: darkModeImg)
                        
                    })
                }
            }
            
        }
        .preferredColorScheme(scheme)
        .tint(Color("textColor"))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
