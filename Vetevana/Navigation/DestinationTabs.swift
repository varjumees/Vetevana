/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The top level tab navigation for the app.
*/

import SwiftUI
import SwiftData

/// The top level tab navigation for the app.
struct DestinationTabs: View {
    /// Keep track of tab view customizations in app storage.
    #if !os(macOS) && !os(tvOS)
    @AppStorage("sidebarCustomizations") var tabViewCustomization: TabViewCustomization
    #endif
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @Query(filter: #Predicate<Guide> { $0.isFeatured }, sort: \.id)
    private var guides: [Guide]
    
    @Namespace private var namespace
    @State private var selectedTab: Tabs = .watchNow

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(Tabs.watchNow.name, systemImage: Tabs.watchNow.symbol, value: .watchNow) {
                WatchNowView()
            }
            .customizationID(Tabs.watchNow.customizationID)
            // Disable customization behavior on the watchNow tab to ensure that the tab remains visible.
            #if !os(macOS) && !os(tvOS)
            .customizationBehavior(.disabled, for: .sidebar, .tabBar)
            #endif
            
            
            Tab(Tabs.library.name, systemImage: Tabs.library.symbol, value: .library) {
                LibraryView()
            }
            .customizationID(Tabs.library.customizationID)
            // Disable customization behavior on the library tab to ensure that the tab remains visible.
            #if !os(macOS) && !os(tvOS)
            .customizationBehavior(.disabled, for: .sidebar, .tabBar)
            #endif
            
            Tab(Tabs.new.name, systemImage: Tabs.new.symbol, value: .new) {
                Text("This view is intentionally blank")
            }
            .customizationID(Tabs.new.customizationID)
            
            Tab(Tabs.favorites.name, systemImage: Tabs.favorites.symbol, value: .favorites) {
                Text("This view is intentionally blank")
            }
            .customizationID(Tabs.favorites.customizationID)
            
            Tab(value: .search, role: .search) {
                Text("This view is intentionally blank")
            }
            .customizationID(Tabs.search.customizationID)
            #if !os(macOS) && !os(tvOS)
            .customizationBehavior(.disabled, for: .sidebar, .tabBar)
            #endif
            
            Tab(Tabs.tips.name, systemImage: Tabs.tips.symbol, value: .tips) {
                TestUI()
            }
            .customizationID(Tabs.tips.customizationID)
            #if !os(macOS) && !os(tvOS)
            .customizationBehavior(.disabled, for: .sidebar, .tabBar)
            #endif
            
            Tab(Tabs.troubleshooting.name, systemImage: Tabs.troubleshooting.symbol, value: .troubleshooting) {
                ErrorGalleryView()
            }
            .customizationID(Tabs.troubleshooting.customizationID)
            #if !os(macOS) && !os(tvOS)
            .customizationBehavior(.disabled, for: .sidebar, .tabBar)
            #endif
            Tab(Tabs.serial.name, systemImage: Tabs.serial.symbol, value: .serial) {
                Serial()
            }
            .customizationID(Tabs.serial.customizationID)
            #if !os(macOS) && !os(tvOS)
            .customizationBehavior(.disabled, for: .sidebar, .tabBar)
            #endif

            #if !os(visionOS)
            TabSection {
                ForEach(Grupp.collectionsList) { group in
                    Tab(group.name, systemImage: group.icon, value: Tabs.collections(group)) {
                        CategoryView(
                            group: group,
                            namespace: namespace
                        )
                    }
                    .customizationID(group.customizationID)
                }
            } header: {
                Label("Seadmed", systemImage: "folder")
            }
            .customizationID(Tabs.collections(.laptops).name)
            #if !os(macOS) && !os(tvOS)
            // Prevent the tab from appearing in the tab bar by default.
            .defaultVisibility(.hidden, for: .tabBar)
            .hidden(horizontalSizeClass == .compact)
            #endif
            
            TabSection {
                ForEach(Grupp.animationsList) { group in
                    Tab(group.name, systemImage: group.icon, value: Tabs.animations(group)) {
                        CategoryView(
                            group: group,
                            namespace: namespace
                        )
                    }
                    .customizationID(group.customizationID)
                }
            } header: {
                Label("Meeskond", systemImage: "folder")
            }
            .customizationID(Tabs.animations(.VA).name)
            #if !os(macOS) && !os(tvOS)
            // Prevent tab from appearing in the tab bar by default.
            .defaultVisibility(.hidden, for: .tabBar)
            .hidden(horizontalSizeClass == .compact)
            #endif
            #endif
        }
        .tabViewStyle(.sidebarAdaptable)
        #if !os(macOS) && !os(tvOS)
        .tabViewCustomization($tabViewCustomization)
        #endif
    }
}

#Preview(traits: .previewData) {
    DestinationTabs()
}

