/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that displays the videos in a playlist.
*/

import SwiftUI
import SwiftData

/// A view that displays the videos in a playlist.
struct CategoryView: View {
  @Environment(\.modelContext) private var modelContext
    
  private let group: Grupp
  private let namespace: Namespace.ID

  @State private var navigationPath: [NavigationNode]
  @Query private var guides: [Guide]
    
  init(
      group: Grupp,
      namespace: Namespace.ID,
      navigationPath: [NavigationNode]? = nil
  ) {
      self.group = group
      self.namespace = namespace
      self._navigationPath = State(initialValue: navigationPath ?? [NavigationNode]())
  }
    
    var body: some View {
        // Wrap the content in a vertically scrolling view.
        NavigationStack(path: $navigationPath) {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text(group.name)
                        .font(.title.bold())
                    
                    Text(group.description)
                        .font(.body)
                    
                    Button("Placeholder", systemImage: "play.fill") {
                    }
                    .buttonStyle(CustomButtonStyle())
                    .padding(.bottom)
                    
                    VStack(spacing: Constants.cardSpacing) {
                        ForEach(guides.filter { $0.groups.contains(group) }) { guide in
                            NavigationLink(value: NavigationNode.guide(guide.id)) {
                                VideoCardView(guide: guide, style: .stack)
                            }
                            .accessibilityLabel(group.name)
                            .transitionSource(id: guide.id, namespace: namespace)

                        }
                        .buttonStyle(buttonStyle)
                    }
                }
                .padding([.horizontal, .bottom], Constants.outerPadding)
                .frame(maxWidth: .infinity, alignment: .leading)
                .navigationDestinationVideo(in: namespace)
            }
            .scrollClipDisabled()
            .toolbarBackground(.hidden)
             
            #if os(tvOS)
            .background(Color("tvBackground"))
            #endif
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
    @Previewable @Namespace var namespace
    CategoryView(group: .desktops, namespace: namespace)
}
