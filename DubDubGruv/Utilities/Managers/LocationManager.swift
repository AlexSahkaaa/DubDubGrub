//
//  LocationManager.swift
//  DubDubGruv
//
//  Created by Alex Kolsa on 13.01.2022.
//

import Foundation

final class LocationManager: ObservableObject {
    @Published var locations: [DDGLocation] = []
}
