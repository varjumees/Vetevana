//
//  Tabs.swift
//  Vetevana
//
//

import SwiftUI

/// A description of the tabs that the app can present.

enum Tabs: Equatable, Hashable, Identifiable {
    case watchNow
    case new
    case favorites
    case library
    case search
    case collections(Grupp)
    case animations(Grupp)
    case tips
    case troubleshooting
    case serial
    
    var id: Int {
        switch self {
        case .watchNow: 2001
        case .new: 2002
        case .favorites: 2003
        case .library: 2004
        case .search: 2005
        case .tips: 2006
        case .troubleshooting: 2007
        case .serial: 2008
        case .collections(let group): group.id
        case .animations(let group): group.id
        }
    }
    
    var name: String {
        switch self {
        case .watchNow: String(localized: "Kodu", comment: "Tab title")
        case .new: String(localized: "Uus", comment: "Tab title")
        case .library: String(localized: "Teek", comment: "Tab title")
        case .favorites: String(localized: "Lemmikud", comment: "Tab title")
        case .search: String(localized: "Otsi", comment: "Tab title")
        case .collections(_): String(localized: "Seadmed", comment: "Tab title")
        case .animations(_): String(localized: "Animations", comment: "Tab title")
        case .tips: String(localized: "Tips", comment: "Tab title")
        case .troubleshooting: String(localized: "Troubleshooting", comment: "Tab title")
        case .serial: String(localized: "Serial", comment: "Tab title")
        }
    }
    
    var customizationID: String {
        return "com.varjumees.Vetevana." + self.name
    }

    var symbol: String {
        switch self {
        case .watchNow: "play"
        case .new: "bell"
        case .library: "books.vertical"
        case .favorites: "heart"
        case .search: "magnifyingglass"
        case .collections(_): "list.and.film"
        case .animations(_): "list.and.film"
        case .tips: "lightbulb"
        case .troubleshooting: "exclamationmark.triangle"
        case .serial: "film"
        }
    }
    
    var isSecondary: Bool {
        switch self {
        case .watchNow, .library, .new, .favorites, .search, .tips, .troubleshooting, .serial:
            false
        case .animations(_), .collections(_):
            true
        }
    }
}
