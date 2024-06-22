//
//  UusDataGeneration.swift
//  Vetevana
//
//

import SwiftUI
import SwiftData

/// A view that displays the hero video banner.
struct HeroView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    private var isCompact: Bool {
        horizontalSizeClass == .compact
    }
    
    let namespace: Namespace.ID
    let guide: Guide

    var body: some View {
        ZStack(alignment: .leading) {
            Group {
                Image(decorative: guide.landscapeImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: Constants.heroViewHeight)
                    .clipped()
                
                // Add a subtle gradient to make the text stand out.
                GradientView(style: .black.opacity(0.9), startPoint: .leading)
                #if os(iOS)
                GradientView(style: .black, height: isCompact ? Constants.compactGradientSize : Constants.gradientSize / 2, startPoint: .bottom)
                #endif
            }
            
            VStack(alignment: .leading, spacing: Constants.verticalTextSpacing) {
                Text(guide.localizedName)
                    .font(isCompact ? .title : .largeTitle)
                    .fontWeight(.bold)
                
                Text(guide.localizedSynopsis)
                    .font(isCompact ? .caption : .body)
                    .fontWeight(isCompact ? .regular : .semibold)
                
                NavigationLink("Uurin lähemalt", value: NavigationNode.guide(guide.id))
                    #if os(iOS)
                    .buttonStyle(CustomButtonStyle())
                    #endif
            }
            .frame(maxWidth: Constants.heroTextMargin, alignment: .leading)
            .padding(Constants.outerPadding)
            .padding(Constants.extendSafeAreaTV)
        }
        .transitionSource(id: guide.id, namespace: namespace)
        .padding(.bottom, isCompact ? 0 : nil)
        .padding(.top, isCompact ? -Constants.compactSafeAreaHeight : -Constants.heroSafeAreaHeight)
        .padding(.horizontal, -Constants.extendSafeAreaTV)
        #if os(tvOS)
        .focusSection()
        #endif
    }
}

#Preview(traits: .previewData) {
    @Previewable @Query(filter: #Predicate<Guide> { $0.isHero }, sort: \.id) var heroGuides: [Guide]
    @Previewable @Namespace var namespace
    
    NavigationStack {
        ScrollView {
            if let heroGuide = heroGuides.first {
                HeroView(namespace: namespace, guide: heroGuide)
            }
        }
    }
}
