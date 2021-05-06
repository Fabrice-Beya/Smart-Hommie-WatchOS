//
//  self.sensorsViewModel.selectedSensor.swift
//  Smart Hommie WatchKit Extension
//
//  Created by Fabrice Beya on 2021/05/03.
//

import SwiftUI

struct SensorView: View {
    @EnvironmentObject var sensorsViewModel: SensorsViewModel
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: self.sensorsViewModel.selectedSensor.type == "Temperature" ? "thermometer" : self.sensorsViewModel.selectedSensor.type == "Humidity" ? "drop.fill" : "")
                    .font(.headline)
                    .foregroundColor(self.sensorsViewModel.selectedSensor.type == "Temperature" ? .red : self.sensorsViewModel.selectedSensor.type == "Humidity" ? .blue : .gray)
                
                Text(self.sensorsViewModel.selectedSensor.location)
                    .font(.headline)
            }
            
            Spacer()
            
            if self.sensorsViewModel.selectedSensor.type == "Temperature" {
                Text(self.sensorsViewModel.selectedSensor.value +  " °C" )
                    .font(.system(size: 58, weight: .light))
            }
            else if self.sensorsViewModel.selectedSensor.type == "Humidity" {
                Text(self.sensorsViewModel.selectedSensor.value +  " %" )
                    .font(.system(size: 58, weight: .bold))
            }
            
            Spacer()
            
            Text(self.sensorsViewModel.selectedSensor.name)
                .font(.subheadline)
            
        }
    }
}

struct SensorView_Previews: PreviewProvider {
    static var previews: some View {
        SensorView().environmentObject(SensorsViewModel.shared)
    }
}
