/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that presents a horizontally scrollable list of collections.
*/

import SwiftUI

/// A view that presents a horizontally scrollable list of collections.
struct CategoryListView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var isCompact: Bool {
        horizontalSizeClass == .compact
    }
    
    let title: LocalizedStringKey
    let collectionsList: [Grupp]
    let namespace: Namespace.ID
    
    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Constants.cardSpacing) {
                    ForEach(collectionsList) { collections in
                        NavigationLink(value: NavigationNode.group(collections.id)) {
                            let image = Image(collections.image).resizable()
                            PosterCard(image: image, title: collections.name)
                                #if os(iOS) || os(visionOS)
                                .hoverEffect()
                                #endif
                        }
                        .frame(width: isCompact ? Constants.compactVideoCardWidth : Constants.videoCardWidth)
                        .accessibilityLabel(collections.name)
                        .buttonStyle(buttonStyle)
                        .transitionSource(id: collections.id, namespace: namespace)
                    }
                }
                .padding(.vertical, Constants.listTitleVerticalPadding)
                .padding(.leading, Constants.outerPadding)
            }
            .scrollClipDisabled()
        } header: {
            Text(title)
                .font(.title3.bold())
                .padding(.leading, Constants.outerPadding)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
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

#Preview {
    @Previewable @Namespace var namespace
    CategoryListView(title: "Collections",
                     collectionsList: Grupp.collectionsList, namespace: namespace)
        .frame(height: 200)
}

