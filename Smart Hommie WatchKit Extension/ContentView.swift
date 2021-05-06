//
//  ContentView.swift
//  Smart Hommie WatchKit Extension
//
//  Created by Fabrice Beya on 2021/05/03.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sensorsViewModel: SensorsViewModel
    
    var body: some View {
        
        if sensorsViewModel.isBusy {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                .scaleEffect(x: 2, y: 2, anchor: .center)
        } else {
            ScrollView{
                NavigationLink(
                    destination: LocationView().environmentObject(sensorsViewModel),
                    isActive: self.$sensorsViewModel.showLocationView,
                    label: {})
                    .buttonStyle(PlainButtonStyle())
                
                VStack{
                    Image(systemName: "house.fill")
                        .font(.title)
                        .foregroundColor(.orange)
                    
                    Text("Welcome to Smart Hommie!")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                Text("Your Locations:")
                    .font(.subheadline)
                    .padding()
                
                ForEach(sensorsViewModel.locations) { location in
                    Button(action: {
                        self.sensorsViewModel.selectedLocation = location
                        self.sensorsViewModel.showLocationView = true
                        
                    }, label: {
                        Text(location.name)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width:  WKInterfaceDevice.current().screenBounds.width*0.95)
                            .background(Color.blue)
                            .clipShape(Capsule())
                            
                    })
                        .buttonStyle(PlainButtonStyle())
                    
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SensorsViewModel.shared)
    }
}
