//
//
//  Tips.swift
//
//
//  Created by varjumees on 22.06.2024.
//  Copyright © 2024 varjumees. All rights reserved.
//
//

import SwiftUI
import SwiftData

struct TestUI: View {
    
    @Query(sort: \Tip.id)
    private var tips: [Tip]
    
    var body: some View {
        List {
            ForEach(Tip.TipCategory.allCases, id: \.self) { category in
                Section(category.rawValue) {
                    ForEach(tips.filter { $0.category == category }) { tip in
                        InstructionRowView(tip: tip)
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationTitle("Näpunäited")
        .navigationSubtitle("Seadmete tüüpvead ja näpunäited")
        
    }
}

#Preview(traits: .previewData) {
    @Previewable @Query(sort: \Tip.id) var tips: [Tip]
    TestUI()
}


struct InstructionRowView: View {
    let tip: Tip
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(systemName: tip.imageName)
                    .font(.system(size: 19))
                    .shadow(color: .black.opacity(0.15), radius: 2, y: 1)
                    .padding(.top, 5)
                    .padding([.horizontal, .bottom], 6)
                    .frame(width: 35, height: 35)
                    .background(
                        Circle()
                            .fill(randomGradient)
                            .frame(width: 38, height: 38)
                    )
                    .overlay {
                        Circle()
                            .strokeBorder(lineWidth: 0.5)
                            .foregroundStyle(.quaternary)
                            .blendMode(colorScheme == .light ? .plusDarker : .plusLighter)
                    }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(tip.name)
                        .font(.title3)
                    
                    (FlowLayout(alignment: .topLeading)) {
                        ForEach(tip.tags) { tag in
                            tag.label
                                .labelStyle(.socialFeedTag)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .backgroundStyle(tagBackgroundStyle)
                }
            }
        }
        .listRowInsets(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8))
    }
    
    var tagBackgroundStyle: AnyShapeStyle {
#if canImport(UIKit)
        return AnyShapeStyle(Color(uiColor: .quaternarySystemFill))
#else
        return AnyShapeStyle(.quaternary.opacity(0.5))
#endif
    }
}

extension InstructionRowView {
    var randomGradient: RadialGradient {
        let colors: [Color] = [.blue, .green, .orange, .purple, .pink, .yellow, .brown, .red, .gray, .mint, .teal]
        let baseColor = colors.randomElement() ?? .blue
        
        // Adjust these values for your desired smoothness
        let center = UnitPoint(x: 0.5, y: 0.5)
        let startRadius = 0.0
        let endRadius = 0.8 // Increase endRadius for a wider, smoother transition
        
        return RadialGradient(gradient: Gradient(colors: [baseColor, baseColor.opacity(0.5), baseColor]),
                              center: center,
                              startRadius: startRadius,
                              endRadius: endRadius)
    }
}
extension LabelStyle where Self == FeedTagLabelStyle {
    static var socialFeedTag: FeedTagLabelStyle {
        FeedTagLabelStyle()
    }
}

struct FeedTagLabelStyle: LabelStyle {
    @ScaledMetric(relativeTo: .footnote) private var iconWidth = 14.0
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .foregroundColor(.secondary)
                .frame(width: iconWidth)
            configuration.title
        }
        .padding(6)
        .background(in: RoundedRectangle(cornerRadius: 5, style: .continuous))
        .font(.caption)
    }
}
