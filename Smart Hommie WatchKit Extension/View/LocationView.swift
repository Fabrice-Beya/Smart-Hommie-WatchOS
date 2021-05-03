//
//  Locations.swift
//  Smart Hommie WatchKit Extension
//
//  Created by Fabrice Beya on 2021/05/03.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject var sensorsViewModel: SensorsViewModel
    @State var location: Location
    
    var body: some View {
        ScrollView{
            VStack{
                Text(location.name)
                    .font(.headline)
                
                VStack(spacing: 6){
                    ForEach(location.sensors) { sensor in
                        NavigationLink(
                            destination: SensorView(sensor: sensor),
                            label: {
                                Text(sensor.type + ": " + sensor.name)
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width:  WKInterfaceDevice.current().screenBounds.width*0.9)
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
        LocationView(location: MokeLocations[0])
    }
}
