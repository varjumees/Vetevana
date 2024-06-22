//
//
// Account.swift
//
//
// Created by varjumees on 04.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import Observation
import Foundation
import SwiftData
import OSLog


@Model public class Account {
    
    @Attribute(.unique) public var id: String
    public var joinDate: Date
    public var displayName: String
    public var emailAddress: String
    public var isPremiumMember: Bool

    public init(joinDate: Date, displayName: String, emailAddress: String, isPremiumMember: Bool) {
        self.id = UUID().uuidString
        self.joinDate = joinDate
        self.displayName = displayName
        self.emailAddress = emailAddress
        self.isPremiumMember = isPremiumMember
        logger.notice("User \(self.id) has been created with DisplayName: '\(self.displayName)' and is \(!self.isPremiumMember ? "not " : "")a premium user.")
    }
}
