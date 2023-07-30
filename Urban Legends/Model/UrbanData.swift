//
//  UrbanData.swift
//  Urban Legends
//
//  Created by MacNCheese on 25/07/2023.
//

import Foundation
import CoreLocation

var urbanEntries = jsonToObjects(fileName: "entries")

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
}
