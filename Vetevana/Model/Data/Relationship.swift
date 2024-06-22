//
//  Relationship.swift
//  Vetevana
//
//

import Foundation


struct RelationshipMapping: Decodable {
    let guideID: Int
    let variationIDs: [Int]
}

extension SampleData {
    @MainActor static let relationships = [
        RelationshipMapping(
            guideID: 0,
            variationIDs: [7]
        ),
        RelationshipMapping(
            guideID: 1,
            variationIDs: [7, 4]
        ),
        RelationshipMapping(
            guideID: 2,
            variationIDs: [7]
        ),
        RelationshipMapping(
            guideID: 3,
            variationIDs: [7]
        ),
        RelationshipMapping(
            guideID: 4,
            variationIDs: [7, 6]
        ),
        RelationshipMapping(
            guideID: 5,
            variationIDs: [2, 7]
            ),
        RelationshipMapping(
            guideID: 6,
            variationIDs: [0, 4]
        ),
        RelationshipMapping(
            guideID: 7,
            variationIDs: [2, 3]
            ),
        RelationshipMapping(
            guideID: 8,
            variationIDs: [3, 4]
        ),
        RelationshipMapping(
            guideID: 9,
            variationIDs: [5]
        ),
        RelationshipMapping(
            guideID: 10,
            variationIDs: [0, 2]
            ),
        RelationshipMapping(
            guideID: 11,
            variationIDs: [0, 1, 2]
        ),
        RelationshipMapping(
            guideID: 12,
            variationIDs: [2, 3]
        )
    ]
}
