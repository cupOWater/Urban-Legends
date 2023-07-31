//
//  MapView.swift
//  Urban Legends
//
//  Created by MacNCheese on 26/07/2023.
//

import SwiftUI
import MapKit

struct MapView : UIViewRepresentable {
    let coordinates : [SightingCoords]
    let zoomLevel : Double
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator : NSObject, MKMapViewDelegate{
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if overlay is MKCircle {
                let boundCircle = MKCircleRenderer(overlay: overlay)
                boundCircle.fillColor = .red
                boundCircle.alpha = 0.2
                return boundCircle
            }
            return MKOverlayRenderer(overlay: overlay)
            
        }
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.delegate = context.coordinator
        
        let region = MKCoordinateRegion(center: coordinates[0].coordinate, span: MKCoordinateSpan(latitudeDelta: zoomLevel, longitudeDelta: zoomLevel))
        mapView.setRegion(region, animated: true)
        
        coordinates.forEach { coord in
            let circle = MKCircle(center: coord.coordinate, radius: coord.area)
            
            mapView.addOverlay(circle)
        }
        
        
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: urbanEntries[0].sighting, zoomLevel: 11)
    }
}
