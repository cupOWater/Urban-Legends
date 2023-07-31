//
//  UrbanEntry.swift
//  Urban Legends
//
//  Created by MacNCheese on 25/07/2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct UrbanEntry : Identifiable, Codable{
    var id : UUID {UUID()}
    var name : String
    var type : String
    var location: String
    var classification : String
    var description : String
    var imageName : String
    var image : Image { Image(imageName) }
    
    var coordinates : [Coordinate]
    var sighting : [SightingCoords] {
        var temp = [SightingCoords]()
        coordinates.forEach{c in
            temp.append(
                SightingCoords(area: c.area, coordinate: CLLocationCoordinate2D(latitude: c.latitude, longitude: c.longitude))
            )
        }
        return temp
    }
}

struct SightingCoords {
    var area : Double
    var coordinate : CLLocationCoordinate2D
}

struct Coordinate : Codable{
    var latitude : Double
    var longitude : Double
    var area : Double
}


