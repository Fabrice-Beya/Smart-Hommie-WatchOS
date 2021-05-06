//
//  Locations.swift
//  Smart Hommie WatchKit Extension
//
//  Created by Fabrice Beya on 2021/05/03.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject var sensorsViewModel: SensorsViewModel
    
    var body: some View {
        ScrollView{
            NavigationLink(
                destination: SensorView().environmentObject(sensorsViewModel),
                isActive: self.$sensorsViewModel.showSensorView,
                label: {})
                .buttonStyle(PlainButtonStyle())
            
            VStack{
                Text(self.sensorsViewModel.selectedLocation.name)
                    .font(.headline)
                
                VStack(spacing: 6){
                    ForEach(sensorsViewModel.selectedLocation.sensors) { sensor in
                        Button(action: {
                            self.sensorsViewModel.selectedSensor = sensor
                            self.sensorsViewModel.showSensorView = true
                        }, label: {
                            Text(sensor.name)
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width:  WKInterfaceDevice.current().screenBounds.width*0.95)
                                .background(sensor.type == "Temperature" ? Color.red : sensor.type == "Humidity" ? Color.blue : Color.gray)
                                .clipShape(Capsule())
                                
                        })
                        .buttonStyle(PlainButtonStyle())
                       
                    }
                }
                .padding()
            }
            
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView().environmentObject(SensorsViewModel.shared)
    }
}
