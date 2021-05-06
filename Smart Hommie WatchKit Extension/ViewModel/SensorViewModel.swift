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

    @Published var locations: [Location] = []
    
//    @Published var location = MockLocations
    
    @Published var selectedLocation: Location = Location()
    @Published var selectedSensor: Sensor = Sensor()
    
    @Published var isBusy = false
    
    @Published var showSensorView = false
    @Published var showLocationView = false
    
    init(){
        fetchSensors()
    }
    
    func fetchSensors(){
        isBusy = true
        
        DB_REF.observe(DataEventType.value, with: { snapshot in
            if !snapshot.exists() {
                self.isBusy = false
                return
            }

            guard let locationsArrayDictionary = snapshot.value as? [String: AnyObject] else { return }
           
            var locs: [Location] = []

            for (key, value) in locationsArrayDictionary {
                
                let sensorArrayDictionary = value as? [String: Any] ?? [:]
                
                var sensors: [Sensor] = []
                
                for (_, value) in sensorArrayDictionary {
                    let sensorDictionary = value as? [String: Any] ?? [:]
    
                    let sensorObject = Sensor(dictionary: sensorDictionary)
                    sensors.append(sensorObject)
    
                    if sensorObject.name + sensorObject.deviceuid == self.selectedSensor.name + self.selectedSensor.deviceuid {
                        self.selectedSensor = sensorObject
                    }
                }
                
                if self.selectedLocation.name == key {
                    self.selectedLocation.sensors = sensors.uniqued()
                    
                    
                }
                
                locs.append(Location(name: key, sensors: sensors.uniqued()))
                
            }

            self.locations  = locs.uniqued()
            
            self.isBusy = false
            
        })
    }
}



