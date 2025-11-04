//
//  Culinary_Roots_AppApp.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 16/10/2025.
//

import SwiftUI
import SwiftData

@main
struct Culinary_Roots_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: AfricanFood.self)
    }
}

