//
//  Importer.swift
//  Vetevana
//
//

import Foundation
import SwiftData
import OSLog

struct Importer {
    
    static let logger = Logger(subsystem: "com.varjumees.Vetevana", category: "Import")
    
    @MainActor static func importTestdata(
        into context: ModelContext,
        isPreview: Bool = false
        
    ) throws {
        logger.info("In Importer.importTestData")
        
        if !isPreview {
            
            guard hasImported == false else { return }
        }
        
        let guides = SampleData.guides
        let variations = SampleData.variations
        let mappings = SampleData.relationships
        let tips = TipData.content
        let tipMappings = TipData.relationships

        // Import Tags
        for tagData in TipData.tags {
            context.insert(tagData)
        }
        
        for error in ErrorInfo.allCases {
            let newError = Error(
                id: error.rawValue,
                problem: error.problem,
                imageName: error.imageName,
                reason: error.reason,
                suggestion: error.suggestion,
                solution: error.solution
            )
            context.insert(newError)
        }
        
        for deviceData in DeviceData.allCases {
            let model = Model(
                name: deviceData.modelIdentifier,
                identifier: deviceData.rawValue,
                modelNumber: deviceData.modelNumber,
                deviceData: deviceData
            )
            context.insert(model)
        }
        // Import Tips and Establish Relationships
        tipMappings.forEach { tipMap in
            if let tip = tips.first(where: { $0.id == tipMap.tipID }) {
                tip.tags = TipData.tags.filter { tipMap.tagIDs.contains($0.id) }
                context.insert(tip)
            }
        }
        
        mappings.forEach { map in
            if let guide = guides.first(where: { $0.id == map.guideID }) {
                guide.variations = variations.filter {
                    map.variationIDs.contains($0.id) }
                
                context.insert(guide)
            }
        }
        try context.save()
        
        UserDefaults.standard.set(true, forKey: "hasImported")
    }
    static var hasImported: Bool {
        UserDefaults.standard.bool(forKey: "hasImported")
    }
}
