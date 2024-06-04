//
//
// Item.swift
// Vetevana
//
// Created by metsava1m on 04.06.2024
// Copyright © 2024 metsava1m. All rights reserved.
//
        

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
