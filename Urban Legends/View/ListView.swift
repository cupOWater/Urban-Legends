//
//  ListView.swift
//  Urban Legends
//
//  Created by MacNCheese on 24/07/2023.
//

import SwiftUI

// THIS IS FOR REMOVING THE 'BACK' TEXT IN NAVIGATION VIEW BACK BUTTON
// FOR SOME REASON IT DOESN'T WORK WHEN I PUT THIS IN THE init() IN THE VIEW
// iOS Lifee. (2022). Remove text from Back button keeping the icon. Retrieved from StackOverflow:    https://stackoverflow.com/questions/33025239/remove-text-from-back-button-keeping-the-icon
extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}

struct ListView: View {
    @State private var darkMode : Bool = true
    @State private var scheme: ColorScheme = .dark
    @State private var darkModeImg = "moon.fill"
    @State private var searchText = ""
    
    // 0: Safe, 1: Neutral, 2: Dangerous
    @State private var filterTypes = [true, true, true]
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Courier", size: 40)!]
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Courier", size: 30)!]
        
        
    }
    
    private func filterEntries(name : String) -> [UrbanEntry]{
        
        let filtered = urbanEntries.filter {
            let classFilter =
            (filterTypes[0] && $0.classification == "Safe") ||
            (filterTypes[1] && $0.classification == "Neutral") ||
            (filterTypes[2] && $0.classification == "Dangerous")
            
            if(!name.isEmpty){
                return ($0.name.contains(name) || $0.type.contains(name)) && classFilter
            }
            return classFilter
        }
        
        
        return filtered
    }
    
    var body: some View {
        
        NavigationView{
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack {
                        HStack{
                            FIlterButton(labelFor: $filterTypes[0], btnLabel: "Safe")
                            FIlterButton(labelFor: $filterTypes[1], btnLabel: "Neutral")
                            FIlterButton(labelFor: $filterTypes[2], btnLabel: "Danger")
                        }
                        .frame(height: 30)
                        .padding()
                        ForEach(filterEntries(name: searchText)){ entry in
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
            .searchable(text: $searchText, prompt: "Search for Name or Type")
            .navigationTitle("CASE FILES")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        darkMode.toggle()
                        if(darkMode){
                            scheme = .dark
                            darkModeImg = "moon.fill"
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
        .tint(Color("f_back"))
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
