/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view the presents a horizontally scrollable list of video cards.
*/

import SwiftUI
import SwiftData

/// A view the presents a horizontally scrollable list of video cards.
struct ListViewTwo: View {
    
    typealias SelectionAction = (Guide) -> Void

    private let title: LocalizedStringKey?
    private let guides: [Guide]
    private let cardStyle: VideoCardStyle
    private let selectionAction: SelectionAction?
    
    let namespace: Namespace.ID
    
    /// Creates a view to display the specified list of videos.
    ///
    /// - Parameters:
    ///   - title: An optional title to display above the list.
    ///   - videos: The list of videos to display.
    ///   - cardStyle: The style for the video cards.
    ///   - selectionAction: An optional action that you can specify to directly handle the card selection.
    ///   - namespace: The namespace id of the parent view.
    ///
    ///    When the app doesn't specify a selection action, the view presents the card as a `NavigationLink.
    init(
        title: LocalizedStringKey? = nil,
        guides: [Guide],
        cardStyle: VideoCardStyle,
        namespace: Namespace.ID,
        selectionAction: SelectionAction? = nil
    ) {
        self.title = title
        self.guides = guides
        self.cardStyle = cardStyle
        self.namespace = namespace
        self.selectionAction = selectionAction
    }
    
    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Constants.cardSpacing) {
                    ForEach(guides) { guide in
                        Group {
                            // If the app initializes the view with a selection action closure,
                            // display a video card button that calls it.
                            if let selectionAction {
                                Button {
                                    selectionAction(guide)
                                } label: {
                                    VideoCardView(guide: guide, style: cardStyle)
                                }
                            }
                            // Otherwise, create a navigation link.
                            else {
                                NavigationLink(value: NavigationNode.guide(guide.id)) {
                                    VideoCardView(guide: guide, style: cardStyle)
                                }
                            }
                        }
                        .accessibilityLabel(guide.localizedName)
                        .transitionSource(id: guide.id, namespace: namespace)
                    }
                }
                .buttonStyle(buttonStyle)
                .padding(.leading, Constants.outerPadding)
            }
            .scrollClipDisabled()
        } header: {
            if let title {
                Text(title)
                    .font(.title3.bold())
                    .padding(.vertical, Constants.listTitleVerticalPadding)
                    .padding(.leading, Constants.outerPadding)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
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

#Preview("Full", traits: .previewData) {
    @Previewable @Query(sort: \Guide.id) var guides: [Guide]
    @Previewable @Namespace var namespace
    
    return NavigationStack {
        ListViewTwo(title: "Featured", guides: guides, cardStyle: .full, namespace: namespace)
            .frame(height: 380)
    }
}
