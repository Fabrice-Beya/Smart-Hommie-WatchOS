//
//  Smart_HommieApp.swift
//  Smart Hommie WatchKit Extension
//
//  Created by Fabrice Beya on 2021/05/03.
//

import Firebase
import SwiftUI

@main
struct Smart_HommieApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(SensorsViewModel.shared)
            }
        }
    }
}
