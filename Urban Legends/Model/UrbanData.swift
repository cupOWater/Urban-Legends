//
//  UrbanData.swift
//  Urban Legends
//
//  Created by MacNCheese on 25/07/2023.
//

import Foundation
import CoreLocation

var urbanEntries = jsonToObjects(fileName: "entries")

//var urbanEntries = [UrbanEntry(name: "Boot Fig", type: "Primate", classification: "Mild", description: "Lorem Ipsum", imageName: "big_foot", coordiate: Coordinate(latitude: 10, longitude: 10, zoom: 500))]

func jsonToObjects(fileName : String) -> [UrbanEntry]{
    if let file = Bundle.main.url(forResource: fileName, withExtension: "json"){
            if let data = try? Data(contentsOf: file) {
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([UrbanEntry].self, from: data)
                    return decoded
                } catch let error {
                    fatalError("Failed to decode JSON: \(error)")
                }
            }
        } else {
            fatalError("Couldn't load \(fileName) file.")
        }
        return [ ] as [UrbanEntry]
//    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode([UrbanEntry].self, from: data)
//                return jsonData
//            } catch {
//                print("error:\(error)")
//            }
//        }
//    return [] as [UrbanEntry]
}
