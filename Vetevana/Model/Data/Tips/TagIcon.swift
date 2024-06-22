



import SwiftData
import Foundation

enum TagIcon: CaseIterable, Codable {
    case tag
    case cpu
    case shippingbox
    case calendar
    case star
    case laptop
    case check
    
    var icon: String {
        switch self {
        case .tag:
            return "tag"
        case .cpu:
            return "cpu.fill"
        case .shippingbox:
            return "shippingbox"
        case .calendar:
            return "calendar.badge.clock"
        case .star:
            return "star"
        case .laptop:
            return "laptopcomputer"
        case .check:
            return "checkmark.circle"
        }
    }
}
