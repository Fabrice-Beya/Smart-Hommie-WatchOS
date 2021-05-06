//
//  Location.swift
//  Smart Hommie WatchKit Extension
//
//  Created by Fabrice Beya on 2021/05/03.
//

import SwiftUI
import Firebase

struct Location: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String = ""
    var sensors: [Sensor] = []
    
    init(){}
    
    init(name :String, sensors : [Sensor]){
        self.name = name
        self.sensors = sensors
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.name == rhs.name
    }
}


let MockLocations = [
    Location(name: "Living Room",
             sensors: [Sensor(name: "DHT11", type: "Temperature", value: "24.5", location: "Living Room"),
                       Sensor(name: "DHT11", type: "Humidity", value: "70", location: "Living Room")]),
Location(name: "Main Bedroom",
         sensors: [Sensor(name: "DHT11", type: "Temperature", value: "24.5", location: "Living Room"),
                   Sensor(name: "DHT11", type: "Humidity", value: "70", location: "Living Room")]),
Location(name: "Bathroom",
         sensors: [Sensor(name: "DHT11", type: "Temperature", value: "24.5", location: "Living Room"),
                   Sensor(name: "DHT11", type: "Humidity", value: "70", location: "Living Room")]),
Location(name: "Office Space",
         sensors: [Sensor(name: "DHT11", type: "Temperature", value: "24.5", location: "Living Room"),
                   Sensor(name: "DHT11", type: "Humidity", value: "70", location: "Living Room")])]
