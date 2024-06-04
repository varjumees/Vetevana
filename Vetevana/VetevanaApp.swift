//
//
// VetevanaApp.swift
// Vetevana
//
// Created by metsava1m on 04.06.2024
// Copyright © 2024 metsava1m. All rights reserved.
//
        

import SwiftUI
import SwiftData

@main
struct VetevanaApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
