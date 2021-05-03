//
//  SensorViewModel.swift
//  Smart Hommie WatchKit Extension
//
//  Created by Fabrice Beya on 2021/05/03.
//

import SwiftUI
import Firebase

class SensorsViewModel: ObservableObject {
    static let shared = SensorsViewModel()

    @Published var locations: [Location] = [Location(name: "Living Room", sensors: []),
                                            Location(name: "Main Bedroom", sensors: []),
                                            Location(name: "Bathroom", sensors: []),
                                            Location(name: "Office Space", sensors: [])]
    
    @Published var isBusy = false
    
    init(){
        fetchSensors()
    }
    
    func fetchSensors(){
        isBusy = true
        
        REF_LIVING_ROOM.observeSingleEvent(of: .value) { [self]snapshot in
            if !snapshot.exists() {
                self.isBusy = false
                return
            }
            
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            for (key, value) in dictionary {
                let sensorDictionary = value as? [String: Any] ?? [:]
                
                let sensorObject = Sensor(dictionary: sensorDictionary)
                self.locations[0].sensors.append(sensorObject)
                
            }
        }
        
        REF_MAIN_BEDROOM.observeSingleEvent(of: .value) { [self]snapshot in
            if !snapshot.exists() {
                self.isBusy = false
                return
            }
            
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            for (key, value) in dictionary {
                let sensorDictionary = value as? [String: Any] ?? [:]
                
                let sensorObject = Sensor(dictionary: sensorDictionary)
                self.locations[1].sensors.append(sensorObject)
                
            }
        }
        
        REF_LIVING_ROOM.observeSingleEvent(of: .value) { [self]snapshot in
            if !snapshot.exists() {
                self.isBusy = false
                return
            }
            
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            for (key, value) in dictionary {
                let sensorDictionary = value as? [String: Any] ?? [:]
                
                let sensorObject = Sensor(dictionary: sensorDictionary)
                self.locations[2].sensors.append(sensorObject)
                
            }
        }
        
        REF_BATHROOM.observeSingleEvent(of: .value) { [self]snapshot in
            if !snapshot.exists() {
                self.isBusy = false
                return
            }
            
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            for (key, value) in dictionary {
                let sensorDictionary = value as? [String: Any] ?? [:]
                
                let sensorObject = Sensor(dictionary: sensorDictionary)
                self.locations[3].sensors.append(sensorObject)
                self.isBusy = false
            }
        }
    }
}



