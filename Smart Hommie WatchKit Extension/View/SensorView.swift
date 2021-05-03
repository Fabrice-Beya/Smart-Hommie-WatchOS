//
//  Sensor.swift
//  Smart Hommie WatchKit Extension
//
//  Created by Fabrice Beya on 2021/05/03.
//

import SwiftUI

struct SensorView: View {
    @EnvironmentObject var sensorsViewModel: SensorsViewModel
    @State var sensor: Sensor
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: sensor.type == "Temperature" ? "thermometer" : sensor.type == "Humidity" ? "drop.fill" : "")
                    .font(.headline)
                    .foregroundColor(sensor.type == "Temperature" ? .red : sensor.type == "Humidity" ? .blue : .gray)
                
                Text(sensor.location)
                    .font(.headline)
            }
            
            Spacer()
            
            if sensor.type == "Temperature" {
                Text(sensor.value +  " °C" )
                    .font(.system(size: 58, weight: .light))
            }
            else if sensor.type == "Humidity" {
                Text(sensor.value +  " %" )
                    .font(.system(size: 58, weight: .bold))
            }
            
            Spacer()
            
            Text(sensor.name)
                .font(.subheadline)
            
        }
    }
}

struct SensorView_Previews: PreviewProvider {
    static var previews: some View {
        SensorView(sensor: MokeLocations[0].sensors[0])
    }
}
