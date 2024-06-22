/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that displays the list of videos the library contains in a grid.
*/

import SwiftUI
import SwiftData

/// A view that displays the list of videos the library contains in a grid.
struct LibraryView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    @Query(sort: \Guide.id)
    private var allGuides: [Guide]
    
    @Query(sort: \Variation.variation)
    private var variations: [Variation]
    
    @Namespace private var namespace
    
    @State private var navigationPath = [NavigationNode]()
    @State private var selectedVariation: Variation?
    
    // Adapt the number columns based on platform and size class.
    private var columns: [GridItem] {
        let gridItem = GridItem(.flexible(), spacing: Constants.cardSpacing)
        let count = horizontalSizeClass == .compact ? Constants.libraryColumnCountCompact : Constants.libraryColumnCount
        return [GridItem](repeating: gridItem, count: count)
    }
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            // Wrap the content in a vertically scrolling view.
            ScrollView(showsIndicators: false) {
                VStack {
                    // Wrap the content in a horizontally scrolling view.
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Button("All") {
                                selectedVariation = nil
                            }
                            .buttonStyle(PickerButtonStyle(isSelected: selectedVariation == nil))

                            ForEach(variations.sorted { $0.localizedName < $1.localizedName }) { variation in
                                Button(variation.localizedName) {
                                    selectedVariation = variation
                                }
                                .buttonStyle(PickerButtonStyle(isSelected: selectedVariation == variation))
                            }
                        }
                    }
                    .defaultScrollAnchor(.center)
                    .scrollClipDisabled()
                    .padding(.bottom)

                    // Filter videos using the genre a person selects.
                    let guides = selectedVariation?.guides.sorted(by: { $0.id < $1.id }) ?? allGuides.sorted { $0.localizedName < $1.localizedName }
                    LazyVGrid(columns: columns, spacing: Constants.cardSpacing) {
                        ForEach(guides) { guide in
                            NavigationLink(value: NavigationNode.guide(guide.id)) {
                                VideoCardView(guide: guide, style: .grid)
                            }
                            .transitionSource(id: guide.id, namespace: namespace)
                            .buttonStyle(buttonStyle)
                        }
                    }
                }
                .navigationDestinationVideo(in: namespace)
                .padding(Constants.outerPadding)
            }
            .scrollClipDisabled()
        }
    }
    
    var buttonStyle: some PrimitiveButtonStyle {
        #if os(tvOS)
        .card
        #else
        .plain
        #endif
    }
}

#Preview(traits: .previewData) {
    LibraryView()
}

