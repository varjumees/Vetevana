//
//
// VetevanaApp.swift
// Vetevana
//
// Created by varjumees on 04.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import SwiftUI
import SwiftData
import os

@main
struct VetevanaApp: App {
    
    private let modelContainer: ModelContainer

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)

                #if os(visionOS)
                .environment(immersiveEnvironment)
                #endif
                #if os(macOS)
                .toolbar(removing: .title)
                .toolbarBackgroundVisibility(.hidden, for: .windowToolbar)
                #endif
                // Set minimum window size
                #if os(macOS) || os(visionOS)
                .frame(minWidth: Constants.contentWindowWidth, maxWidth: .infinity, minHeight: Constants.contentWindowHeight, maxHeight: .infinity)
                #endif
                // Use a dark color scheme on supported platforms.
                #if os(iOS) || os(macOS)
                .preferredColorScheme(.dark)
                #endif
        }
        #if !os(tvOS)
        .windowResizability(.contentSize)
        #endif
    }
    init() {
        do {
            let modelContainer = try ModelContainer(for: Guide.self, Variation.self, Tag.self, Tip.self, Error.self, Model.self)
            try Importer.importTestdata(into: modelContainer.mainContext)
            self.modelContainer = modelContainer
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

let logger = Logger()

