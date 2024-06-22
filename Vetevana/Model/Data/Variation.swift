//
//  Type.swift
//  Vetevana
//
//

import Foundation
import SwiftData

@Model
final class Variation: Identifiable {
    @Relationship
    var guides: [Guide]
    
    var id: Int
    var variation: String
    
    init(
        id: Int,
        variation: String,
        guides: [Guide] = []
    ) {
        self.id = id
        self.variation = variation
        self.guides = guides
    }
}

extension Variation {
    var localizedName: String {
        String(localized: LocalizedStringResource(stringLiteral: self.variation))
    }
}

extension SampleData {
    @MainActor static let variations = [
        Variation(
            id: 0,
            variation: "Apple Silicon"
        ),
        Variation(
            id: 1,
            variation: "Intel"
        ),
        Variation(
            id: 2,
            variation: "MacBook"
        ),
        Variation(
            id: 3,
            variation: "iMac"
        ),
        Variation(
            id: 4,
            variation: "Mac mini"
        ),
        Variation(
            id: 5,
            variation: "Mac Studio"
        ),
        Variation(
            id: 6,
            variation: "Mac Pro"
        ),
        Variation(
            id: 7,
            variation: "Apple Display"
        )
    ]
}
