//
//  EarthquakesApp.swift
//  Earthquakes
//
//  Created by Marcel on 16.10.2023.
//

import SwiftUI

@main
struct EarthquakesApp: App {
    @StateObject var quakesProvider = QuakesProvider()
    var body: some Scene {
        WindowGroup {
            Quakes()
                .environmentObject(quakesProvider)
        }
    }
}
