

import Foundation
import SwiftData
import SwiftUI

struct PreviewData: PreviewModifier {
    static func makeSharedContext() throws -> ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(
            for: Guide.self, Variation.self, Tag.self, Tip.self, Error.self, Model.self,
            configurations: config
        )
        try Importer.importTestdata(into: container.mainContext, isPreview: true)
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var previewData: Self = .modifier(PreviewData())
}
