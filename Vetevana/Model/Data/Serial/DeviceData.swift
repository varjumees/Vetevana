//
//
//  DeviceData.swift
//
//
//  Created by varjumees on 22.06.2024.
//  Copyright © 2024 varjumees. All rights reserved.
//
//

import SwiftUI
import SwiftData

enum DeviceData: String, CaseIterable, Codable {
    
    //MARK: - MacBook Air intel
    case macBookAir81 = "MacBookAir8,1"
    case macBookAir82 = "MacBookAir8,2"
    case macBookAir91 = "MacBookAir9,1"
    
    //MARK: - MacBook Pro intel
    case macBookPro152 = "MacBookPro15,2"
    case macBookPro153 = "MacBookPro15,3"
    case macBookPro151 = "MacBookPro15,1"
    case macBookPro154 = "MacBookPro15,4"
    case macBookPro161 = "MacBookPro16,1"
    case macBookPro162 = "MacBookPro16,2"
    case macBookPro163 = "MacBookPro16,3"
    
    //MARK: - iMac intel
    case iMacPro11 = "iMacPro1,1"
    case iMac202 = "iMac20,2"
    
    //MARK: - Mac mini intel
    case macMini81 = "MacMini8,1"
    
    var deviceName: String {
        switch self {
        case .macBookAir81, .macBookAir82, .macBookAir91: return "MacBook Air"
        case .macBookPro152, .macBookPro153, .macBookPro154, .macBookPro151, .macBookPro161, .macBookPro162, .macBookPro163: return "MacBook Pro"
        case .iMacPro11, .iMac202: return "iMac"
        case .macMini81: return "Mac mini"
        }
    }
    
    var modelIdentifier: String {
        switch self {
        case .macBookAir81:
            return "MacBook Air 13-tolli (2018)"
        case .macBookAir82:
            return "MacBook Air 13-tolli (2019)"
        case .macBookAir91:
            return "MacBook Air 13-tolli (2020)"
            
        case .macBookPro152:
            return "MacBook Pro 13-tolli 4TBT (2018-2019)"
        case .macBookPro151:
            return "MacBook Pro 15-tolli (2019)"
        case .macBookPro153:
            return "MacBook Pro 15-tolli (2018)"
        case .macBookPro154:
            return "MacBook Pro 13-tolli 2TBT (2019)"
        case .macBookPro161:
            return "MacBook Pro 16-tolli (2019)"
        case .macBookPro162:
            return "MacBook Pro 13-tolli 4TBT (2020)"
        case .macBookPro163:
            return "MacBook Pro 13-tolli 2TBT (2020)"
            
        case .iMacPro11:
            return "iMac Pro (2017)"
        case .iMac202:
            return "iMac Retina 5K, 27-tolli (2020)"
            
        case .macMini81:
            return "Mac Mini (2018)"
        }
    }
    
    var modelNumber: String {
        switch self {
        case .macBookAir81:
            return "A1932"
        case .macBookAir82:
            return "A1932"
        case .macBookAir91:
            return "A2179"
            
        case .macBookPro152:
            return "A1989"
        case .macBookPro153:
            return "A1990"
        case .macBookPro151:
            return "A1990"
        case .macBookPro154:
            return "A2159"
        case .macBookPro161:
            return "A2141"
        case .macBookPro162:
            return "A2251"
        case .macBookPro163:
            return "A2289"
            
        case .iMacPro11:
            return "A1862"
        case .iMac202:
            return "A2115"
            
        case .macMini81:
            return "A1993"
        }
    }
}
