/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that displays information about a video including its title, description, and genre.
*/
import SwiftUI
import SwiftData

/// A view that displays information about a video including its title, description, and genre.
struct InfoView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    private var isCompact: Bool {
        horizontalSizeClass == .compact
    }
    
    let guide: Guide
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(guide.formattedYear) | \(guide.localizedContentRating)",
                 comment: "Release Year | Rating | Duration")
                #if os(tvOS)
                .font(.caption)
                #else
                .font(isCompact ? .caption : .headline)
                #endif
                .foregroundStyle(.secondary)

            Text(guide.localizedName)
                .font(isCompact ? .body : .title3)

            Text(guide.localizedSynopsis)
                .font(isCompact ? .caption : .body)
                .lineLimit(2, reservesSpace: true)

            GenreView(variations: guide.variations)
        }
        .padding(Constants.cardPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

/// A view that displays a list of genres for a video.
struct GenreView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    private var isCompact: Bool {
        horizontalSizeClass == .compact
    }
    
    let variations: [Variation]
    
    var body: some View {
        HStack(spacing: Constants.genreSpacing) {
            ForEach(variations) {
                Text($0.localizedName)
                    .fixedSize()
                    .font(isCompact ? .caption2 : .caption)
                    .padding(.horizontal, Constants.genreHorizontalPadding)
                    .padding(.vertical, Constants.genreVerticalPadding)
                    .background(Capsule().stroke())
            }
        }
    }
}

/*
/// A view that displays the name of a position, followed by one or more people who hold the position in the video.
struct RoleView: View {
    let role: String
    let people: [Person]
    
    var body: some View {
        let peopleString = people.map { $0.displayName }

        VStack(alignment: .leading) {
            Text(role)
            Text(peopleString.formatted())
        }
    }
}
*/
/// A view that displays a the video poster image with its title..
struct PosterCard: View {
    let image: Image
    let title: String
    
    var body: some View {
        #if os(tvOS)
        ZStack(alignment: .bottom) {
            image
                .scaledToFill()
            
            // Material gradient
            GradientView(style: .ultraThinMaterial, height: 90, startPoint: .bottom)
            Text(title)
                .font(.caption.bold())
                .padding()
        }
        .cornerRadius(Constants.cornerRadius)
        #else
        VStack {
            image
                .scaledToFill()
                .cornerRadius(Constants.cornerRadius)
            
            Text(title)
            #if os(visionOS)
                .font(.title3)
            #else
                .font(.body)
            #endif
                .lineLimit(1)
        }
        #endif
    }
}


#Preview(traits: .previewData) {
    @Previewable @Query(sort: \Guide.id) var guides: [Guide]
    return InfoView(guide: guides.first!)
        .frame(width: Constants.videoCardWidth)
}

