//
//
// Account+DataGeneration.swift
//
//
// Created by varjumees on 04.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import Foundation
import OSLog
import SwiftData


extension Account {
    static func generateAccount(modelContext: ModelContext) {
        logger.info("Generating/Fetching Account")
        
        let date = Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 5, hour: 9, minute: 41))!
        let account = Account(
            joinDate: date,
            displayName: "Computers VA",
            emailAddress: "computersva@icloud.com",
            isPremiumMember: true
        )
        modelContext.insert(account)
        
        logger.info("Finished Generating/Fetching Account")
    }
}
