//
//  Guide.swift
//  Vetevana
//
//

import Foundation
import SwiftData
import SwiftUI


@Model
final class Guide: Identifiable {
    @Relationship(inverse: \Variation.guides)
    var variations: [Variation]
    
    private var groupIDs: [Int]

    @Transient
    var groups: [Grupp] {
        get {
            groupIDs.compactMap { Grupp(rawValue: $0) }
        }
        set {
            groupIDs = newValue.map(\.rawValue)
        }
    }
    
    var id: Int
    var imageName: String
    var name: String
    var synopsis: String
    var year: Int
    var contentRating: String
    var isHero: Bool
    var isFeatured: Bool
    
    init(
        variations: [Variation] = [],
        groupIDs: [Int] = [],
        id: Int,
        imageName: String,
        name: String,
        synopsis: String,
        year: Int = 2024,
        contentRating: String = "NR",
        isHero: Bool = false,
        isFeatured: Bool = false
    ) {
        self.variations = variations
        self.groupIDs = groupIDs
        self.id = id
        self.imageName = imageName
        self.name = name
        self.synopsis = synopsis
        self.year = year
        self.contentRating = contentRating
        self.isHero = isHero
        self.isFeatured = isFeatured
    }
}

extension Guide {
    var formattedYear: String {
        year
            .formatted(.number.grouping(.never))
    }
    var landscapeImageName: String {
        "\(imageName)_landscape"
    }
    
    var portraitImageName: String {
        "\(imageName)_portrait"
    }
    
    var localizedName: String {
        String(localized: LocalizedStringResource(stringLiteral: self.name))
    }
    
    var localizedSynopsis: String {
        String(localized: LocalizedStringResource(stringLiteral: self.synopsis))
    }
    
    var localizedContentRating: String {
        String(localized: LocalizedStringResource(stringLiteral: self.contentRating))
    }
    var imageData: Data {
        PlatformImage(named: landscapeImageName)?.imageData ?? Data()
    }
    /*
    public func toggleUpNext(in context: ModelContext) {
        if let upNextItem {
            context.delete(upNextItem)
            self.upNextItem = nil
        } else {
            let item = UpNextItem(video: self)
            context.insert(item)
            self.upNextItem = item
        }
    }
     */
}
