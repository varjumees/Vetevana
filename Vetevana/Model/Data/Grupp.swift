//
//  Group.swift
//  Vetevana
//
//

import SwiftUI

enum Grupp: Int, Equatable, Hashable, Identifiable, CaseIterable {
    case desktops = 1000
    case laptops = 1001
    case allInOnes = 1002
    case displays = 1003
    case VA = 1004
    case miniVA = 1005
    
    public var id: Int {
        rawValue
    }
    
    var name: String {
        switch self {
        case .desktops: String(localized: "Lauaarvutid", comment: "Collection name")
        case .laptops: String(localized: "Sülearvutid", comment: "Collection name")
        case .allInOnes: String(localized: "iMacid", comment: "Collection name")
        case .displays: String(localized: "Ekraanid", comment: "Collection name")
        case .VA: String(localized: "VA", comment: "Collection name")
        case .miniVA: String(localized: "Mini VA", comment: "Collection name")
        }
    }
    
    var description: String {
        switch self {
        case .desktops:
            String(localized: """
            Õpi Mac mini, Mac Studio ja Mac Pro arvutite remonti! Videod sisaldavad tõrkeotsingu juhiseid, \
            samm-sammult remondiprotsesse ning näpunäiteid nii algajatele kui ka kogenud remontijatel.
            """, comment: "Description for desktop repair manual videos.")
        case .laptops:
            String(localized: """
            Kõik, mida vajad erinevate Apple'i sülearvutite parandamiseks. Videod hõlmavad diagnoosimist, \
            emaplaadi, ekraani, klaviatuuri ja aku vahetust ning palju muud.
            """, comment: "Description for laptop repair manual videos.")
        case .allInOnes:
            String(localized: """
            iMac'i remont ei ole kunagi olnud lihtsam! Videotes näitame, kuidas lahendada levinud probleeme, \
            vahetada komponente ning taastada oma iMac'i tippvormi.
            """, comment: "Description for all-in-one repair manual videos.")
        case .displays:
            String(localized: """
            Kas Apple'i ekraanil on probleeme? Õpi, kuidas diagnoosida ja parandada erinevaid vigu, \
            alates taustvalgusest kuni pildikvaliteedini.
            """, comment: "Description for display repair manual videos.")
        case .VA:
            String(localized: """
            Selles videokogus on professionaalsed juhised erinevate videokaartide parandamiseks, \
            sh nii tarkvara kui ka riistvara probleemide tõrkeotsinguks ja lahendamiseks.
            """, comment: "Description for Value Add.")
        case .miniVA:
            String(localized: """
            Õpi, kuidas parandada väikeseid ja kaasaskantavaid videokaarte, mis on populaarsed sülearvutites \
            ja muudes mobiilsetes seadmetes.
            """, comment: "Description for mini video adapter repair manual videos.")
        }
    }
    var tab: Tabs {
        switch self {
        case .desktops, .laptops, .allInOnes, .displays:
                .collections(self)
        case .VA, .miniVA:
                .animations(self)
        }
    }
    var icon: String {
        switch self {
        default:
            "list.and.film"
        }
    }
    var image: String {
        switch self {
        case .desktops:
            "cinematic_poster"
        case .laptops:
            "forest_poster"
        case .allInOnes:
            "sea_poster"
        case .displays:
            "animals_poster"
        case .VA:
            "amazing_poster"
        case .miniVA:
            "extraordinary_poster"
        }
    }
    var customizationID: String {
        return "com.varjumees.Vetevana." + self.name
    }
    static var collectionsList: [Grupp] {
        [.desktops, .laptops, .allInOnes, .displays]
    }
    
    static var animationsList: [Grupp] {
        [.VA, .miniVA]
    }
    
    static func findCategory(from id: Int) -> Grupp? {
        Grupp.allCases.first { $0.id == id }
    }

}
