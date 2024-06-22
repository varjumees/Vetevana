


import SwiftData
import SwiftUI

@Model
final class Tip: Identifiable {
    @Relationship(inverse: \Tag.tips)
    var tags: [Tag]
    
    var id: Int
    var name: String
    var imageName: String
    
    var category: TipCategory
    
    enum TipCategory: String, CaseIterable, Codable {
        case macbook = "MacBook"
        case macbookAir = "MacBook Air"
        case macbookPro = "MacBook Pro"
    }
    
    init(
        tags: [Tag] = [],
        id: Int,
        name: String,
        imageName: String,
        category: TipCategory
    ) {
        self.tags = tags
        self.id = id
        self.name = name
        self.imageName = imageName
        self.category = category
    }
}
