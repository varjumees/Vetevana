//
//
// TutorialData+DataGeneration.swift
//
//
// Created by varjumees on 05.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import Foundation
import SwiftData
import OSLog


extension Tutorial {
    static func generateTutorial(modelContext: ModelContext) {
        logger.info("Generating/Fetching Tutorials")
        
        modelContext.insert(Tutorial(
            type: .setup, // Use the enum case directly
            title: "Kuumaõhujaama üles seadmine",
            subTitle: "Kuidas valmistada ette kuumaõhujaam kivi eemaldamiseks",
            imageName: "checklist"
        ))
        
        modelContext.insert(Tutorial(
            type: .removal, // Use the enum case directly
            title: "Kivi eemaldamine emaplaadilt",
            subTitle: "Kuidas eemaldada emaplaadilt kivi kasutades kuumaõhujaama",
            imageName: "esim"
        ))
        modelContext.insert(Tutorial(
            type: .preparation, // Use the enum case directly
            title: "Eemaldatud kivi ettevalmistamine programmeerimiseks",
            subTitle: "Kuidas eemaldatud kivi programmeerimiseks ette valmistada",
            imageName: "square.and.pencil"
        ))
        
        logger.info("Generated Tutorials")
    }
    
}
