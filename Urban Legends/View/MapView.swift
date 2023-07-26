//
//  MapView.swift
//  Urban Legends
//
//  Created by MacNCheese on 26/07/2023.
//

import SwiftUI
import MapKit


struct MapView: View {
    var coordinates : [SightingCoords]
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: coordinates){c in
            MapMarker(coordinate: c.coordinate, tint: Color("f_back"))
        }
        .onAppear{
            region = MKCoordinateRegion(center: coordinates[0].coordinate, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: urbanEntries[0].sighting)
    }
}
