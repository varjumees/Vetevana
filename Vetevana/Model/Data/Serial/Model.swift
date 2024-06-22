//
//
//  Model.swift
//
//
//  Created by varjumees on 22.06.2024.
//  Copyright © 2024 varjumees. All rights reserved.
//
//

import SwiftUI
import SwiftData

@Model
final class Model: Identifiable {
    var id: String { name }
    var name: String
    var identifier: String
    var modelNumber: String
    var date: Date?
    
    @Attribute
    var deviceData: DeviceData
    
    init(name: String, identifier: String, modelNumber: String, date: Date? = nil, deviceData: DeviceData) {
        self.name = name
        self.identifier = identifier
        self.modelNumber = modelNumber
        self.date = date
        self.deviceData = deviceData
    }
}
