





import Foundation

struct TipRelationships: Decodable {
    let tipID: Int
    let tagIDs: [Int]
}

extension TipData {
    @MainActor static let relationships = [
        
        // MARK: - 12" MacBook
        TipRelationships(
            tipID: 0,
            tagIDs: [0, 9, 34]
        ),
        TipRelationships(
            tipID: 1,
            tagIDs: [0, 9, 34, 35]
        ),
        TipRelationships(
            tipID: 2,
            tagIDs: [0, 9, 34, 35, 38]
        ),
        TipRelationships(
            tipID: 3,
            tagIDs: [0, 9, 34, 35]
        ),
        
        // MARK: - MacBook Air
        TipRelationships(
            tipID: 4,
            tagIDs: [13, 14, 33, 35]
        ),
        TipRelationships(
            tipID: 5,
            tagIDs: [15, 16, 17]
        ),
        TipRelationships(
            tipID: 6,
            tagIDs: [21, 22]
        ),
        TipRelationships(
            tipID: 7,
            tagIDs: [21, 31, 32]
        ),
        TipRelationships(
            tipID: 8,
            tagIDs: [21, 24, 23, 25, 26]
        ),
        TipRelationships(
            tipID: 9,
            tagIDs: [20, 1, 27]
        ),
        
        // MARK: - MacBook Pro
        TipRelationships(
            tipID: 10,
            tagIDs: [12, 1, 30]
        ),
        TipRelationships(
            tipID: 11,
            tagIDs: [10, 2, 37]
        ),
        TipRelationships(
            tipID: 12,
            tagIDs: [40, 4, 2, 5, 6, 7, 11, 8, 3]
        ),
    ]
}
