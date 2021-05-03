//
//  Sensor.swift
//  Smart Hommie WatchKit Extension
//
//  Created by Fabrice Beya on 2021/05/03.
//

import SwiftUI
import Firebase

struct Sensor: Identifiable {
    var id: String = UUID().uuidString
    var name: String = ""
    var deviceuid: String = ""
    var type: String = ""
    var value: String = ""
    var location: String = ""
    
    init(dictionary: [String: Any]){
        self.id = dictionary["id"] as? String ?? UUID().uuidString
        self.deviceuid = dictionary["deviceuid"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.type = dictionary["type"] as? String ?? ""
        let value = dictionary["value"] as? Double ?? 0.0
        self.value = String(format: "%.1f", value)
        self.location = dictionary["location"] as? String ?? ""
    }
    
    init(name: String, type: String, value: String, location: String){
        self.name = name
        self.type = type
        self.value = value
        self.location = location
    }
}
