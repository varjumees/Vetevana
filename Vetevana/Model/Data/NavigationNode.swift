/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A single unit in the app's navigation stack.
*/

import SwiftUI

/// A single unit in the app's navigation stack.

enum NavigationNode: Equatable, Hashable, Identifiable {
    case group(Int)
    case guide(Int)

    var id: Int {
        switch self {
        case .group(let id): id
        case .guide(let id): id
        }
    }
}
