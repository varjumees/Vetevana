/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that presents the video content details.
*/

import SwiftUI
import SwiftData

/// A view that presents the video content details.
struct DetailView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.modelContext) private var context
    
    private var isCompact: Bool {
        horizontalSizeClass == .compact
    }
    
    @State var guide: Guide
    @State private var viewSize: CGSize = CGSize(width: 0, height: 0)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack(alignment: .leading, spacing: Constants.verticalTextSpacing) {
                    Text(guide.localizedName)
                        .font(isCompact ? .title : .largeTitle)
                        .bold()
                    
                    Text("\(guide.year) | \(guide.localizedContentRating)",
                         comment: "Release Year | Rating | Duration")
                    .font(.headline)
                    .accessibilityLabel("""
                                        Released \(guide.year), rated \(guide.localizedContentRating)
                                        """)
                    
                    GenreView(variations: guide.variations)
                    
                    Text(guide.localizedSynopsis)
                        .multilineTextAlignment(.leading)
                        .font(isCompact ? .body : .headline)
                        .fontWeight(.semibold)

                    HStack {
                        // A button that plays the video in a full-window presentation.
                        Button {
                            /// Load the media item for full-window presentation.
                            //do nothing
                        } label: {
                            Label("Placeholder", systemImage: "play.fill")
                        }
                        // A button that toggles whether the video is in the Up Next queue.
                     /*
                        Button {
                            guide.toggleUpNext(in: context)
                        } label: {
                            let isQueued = guide.upNextItem != nil
                            Label(isQueued ? "Mängib järgmisena" : "Mängi järgmisena",
                                  systemImage: isQueued ? "checkmark" : "plus")
                        }
*/
                        Spacer()

                    }
                    .buttonStyle(CustomButtonStyle())
                    // Make the buttons the same width.
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(isCompact ? Constants.detailCompactPadding : Constants.detailPadding)
                .padding(.bottom, isCompact ? Constants.detailCompactPadding : 0)
                .padding(.trailing, isCompact ? 0 : Constants.detailTrailingPadding)
                .frame(height: viewSize.height, alignment: .bottom)
                .background(alignment: .bottom) { backgroundView }

                #if !os(tvOS)
                VStack(alignment: .leading, spacing: Constants.verticalTextSpacing) {
                    #if os(visionOS)
                    Text("Extras")
                        .font(.headline)
                    
                    // A view that plays video in an inline presentation.
                    TrailerView(video: video)
                        .aspectRatio(16 / 9, contentMode: .fit)
                        .frame(maxWidth: Constants.trailerHeight)
                        .cornerRadius(Constants.cornerRadius)
                    #endif
                    
                    Text("Headine")
                        .font(.headline)
                    
                    /*
                    RoleView(role: String(localized: "Pealkiri 1", comment: "A participant in making a video."), people: video.actors)
                    RoleView(role: String(localized: "Pealkiri 2", comment: "A participant in making a video."), people: video.directors)
                    RoleView(role: String(localized: "Pealkiri 3", comment: "A participant in making a video."), people: video.writers)
                     */
                    
                }
                .padding(isCompact ? Constants.detailCompactPadding : Constants.detailPadding)
                .padding(.bottom, isCompact ? Constants.detailCompactPadding : 0)
                .frame(maxWidth: .infinity, alignment: .leading)
                #endif
            }
            #if os(iOS)
            .background(.black)
            #endif
        }
        .scrollClipDisabled()
        .padding(.top, isCompact ? -Constants.compactDetailSafeAreaHeight : -Constants.detailSafeAreaHeight)
        .onGeometryChange(for: CGSize.self) { proxy in
            return proxy.size
        } action: { size in
            let heightPadding = (isCompact ? Constants.compactDetailSafeAreaHeight : Constants.detailSafeAreaHeight) + Constants.extendSafeAreaTV
            let widthPadding = Constants.extendSafeAreaTV
            viewSize = CGSize(width: size.width + widthPadding, height: size.height + heightPadding)
        }
        // Don't show a navigation title in iOS.
        .navigationTitle("")
        .toolbarBackground(.hidden)
    }
    
    /// Returns a background image for the view orientation.
    private var backgroundImage: Image {
        let usePortrait = viewSize.height > viewSize.width
        return Image(decorative: usePortrait ? guide.portraitImageName : guide.landscapeImageName).resizable()
    }
    
    private var backgroundView: some View {
        Group {
            backgroundImage
                .scaledToFill()
                .frame(width: viewSize.width, height: viewSize.height)
                .clipped()
            
            // Add a subtle gradient to make the text stand out.
            #if os(iOS)
            GradientView(style: .black.opacity(0.6), direction: .horizontal, width: Constants.gradientSize, startPoint: .leading)
            GradientView(style: .black, height: Constants.gradientSize, startPoint: .bottom)
            #else
            GradientView(style: .black.opacity(0.4), direction: .horizontal, width: Constants.gradientSize, startPoint: .leading)
            GradientView(style: .black.opacity(0.5), height: Constants.gradientSize, startPoint: .bottom)
            #endif
        }
        .padding([.horizontal, .bottom], -Constants.extendSafeAreaTV)
    }
}


#Preview(traits: .previewData) {
    @Previewable @Query(sort: \Guide.id) var guides: [Guide]
     DetailView(guide: guides.first!)
}
