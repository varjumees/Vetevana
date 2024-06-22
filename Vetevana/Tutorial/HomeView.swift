//
//
// HomeView.swift
// Vetevana
//
// Created by varjumees on 06.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//

/*
import SwiftUI
import SwiftData
import VetevanaData

struct HomeView: View {
    @Binding var navigationSelection: Navigation?
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var sizeClass
    #endif

    var body: some View {
        NavigationStack {
            WidthThresholdReader(widthThreshold: 520) { proxy in
                ScrollView(.vertical) {
                    BrandHeader()
                    VStack(spacing: 16) {
                        Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                            if proxy.isCompact {
                                errors
                                errors
                                errors
                                errors
                            } else {
                                GridRow {
                                    errors
                                    errors
                                }
                                GridRow {
                                    errors
                                    errors
                                }
                            }
                        }
                        .containerShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .fixedSize(horizontal: false, vertical: true)
                        .padding([.horizontal, .bottom], 16)
                        .frame(maxWidth: 1200)
                    }
                }
            }
            #if os(iOS)
            .background(Color(uiColor: .systemGroupedBackground))
            #else
            .background(.quaternary.opacity(0.5))
            #endif
            .background()
            .navigationTitle("Kodu")
            .navigationDestination(for: Navigation.self) { navigation in
                switch navigation {
                case .errors:
                    ErrorGalleryView()
                default:
                    EmptyView()
                }
            }
        }
    }

    // MARK: - Cards
    
    var errors: some View {
        ErrorFeedCard(navigation: cardNavigation)
    }
    
    var cardNavigation: HomeCardHeaderNavigation {
        let useNavigationLink: Bool = {
            #if os(iOS)
            return sizeClass == .compact
            #else
            return false
            #endif
        }()
        if useNavigationLink {
            return .navigationLink
        } else {
            return .selection($navigationSelection)
        }
    }
}


enum HomeCardHeaderNavigation {
    case navigationLink
    case selection(Binding<Navigation?>) // Use AppScreen for the binding
}
*/
