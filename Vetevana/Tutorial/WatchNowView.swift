/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that presents the app's content library.
*/

import SwiftUI
import SwiftData

/// A view that presents the app's content library.
struct WatchNowView: View {
    @State private var navigationPath = [NavigationNode]()
    @Namespace private var namespace
    
    @Query(filter: #Predicate<Guide> { $0.isHero }, sort: \.id)
    private var heroVideos: [Guide]
    
    @Query(filter: #Predicate<Guide> { $0.isFeatured }, sort: \.id)
    private var featuredVideos: [Guide]
    
    
    var body: some View {
        // Wrap the content in a vertically scrolling view.
        NavigationStack(path: $navigationPath) {
            ScrollView(showsIndicators: false) {
                VStack {
                    if let heroVideo = heroVideos.first {
                        HeroView(namespace: namespace, guide: heroVideo)
                    }

                    // Display a horizontally scrolling list of videos and playlists.
                    VStack(spacing: 20) {
                        ListViewTwo(title: "Esiletõstetud",
                                      guides: featuredVideos,
                                      cardStyle: .full, namespace: namespace)
                        
                        CategoryListView(title: "Seadmed",
                                         collectionsList: Grupp.collectionsList, namespace: namespace)
                        
                        CategoryListView(title: "Osakonnad",
                                         collectionsList: Grupp.animationsList, namespace: namespace)
/*
                        if !playlist.isEmpty {
                            ListViewTwo(title: "Mängib järgmisena",
                                          videos: playlist.compactMap(\.video),
                                          cardStyle: .half, namespace: namespace)
                        }
                        */
                    }
                    .padding(.bottom, Constants.outerPadding)
                }
            }
            .scrollClipDisabled()
            .navigationDestinationVideo(in: namespace)
            #if os(visionOS)
            .overlay(alignment: .topLeading) {
                ProfileButtonView()
            }
            #endif
        }
    }
}

#Preview(traits: .previewData) {
    WatchNowView()
}

