//
//  DubDubGruvApp.swift
//  DubDubGruv
//
//  Created by Alex Kolsa on 07.09.2021.
//

import SwiftUI

@main
struct DubDubGruvApp: App {
    
    let locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            AppTabView().environmentObject(locationManager)
        }
    }
}
