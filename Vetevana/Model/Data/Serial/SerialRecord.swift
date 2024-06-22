//
//
//  SerialRecord.swift
//
//
//  Created by varjumees on 22.06.2024.
//  Copyright © 2024 varjumees. All rights reserved.
//
//
/*
import SwiftUI
import SwiftData

@Model
final class SerialRecord: Identifiable {
    var id: String // Make id a UUID for uniqueness
    
    @Relationship
    var model: Model // Use a direct relationship to Model
    
    var serial: String
    var date: Date
    var isDuplicated: Bool
    
    init(id: String, model: Model, serial: String, date: Date, isDuplicated: Bool) {
        self.id = id
        self.model = model
        self.serial = serial
        self.date = date
        self.isDuplicated = isDuplicated
    }
    
    func matchesSearch(text: String, dateFormatter: DateFormatter) -> Bool {
        model.name.localizedCaseInsensitiveContains(text) ||
        serial.localizedCaseInsensitiveContains(text) ||
        model.identifier.localizedCaseInsensitiveContains(text) ||
        model.modelNumber.localizedCaseInsensitiveContains(text) ||
        dateFormatter.string(from: date).localizedCaseInsensitiveContains(text) ||
        (isDuplicated ? "Jah" : "Ei").localizedCaseInsensitiveContains(text)
    }
}
*/
