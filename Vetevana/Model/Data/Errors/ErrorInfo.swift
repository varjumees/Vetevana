//
//
//  ErrorInfo.swift
//
//
//  Created by varjumees on 22.06.2024.
//  Copyright © 2024 varjumees. All rights reserved.
//
//

import SwiftUI
import SwiftData

enum ErrorInfo: String, CaseIterable, Codable {
    // MARK: - Error codes
    
    case error1 = "Error 1"
    case error6 = "Error 6"
    case error9 = "Error 9"
    case error10 = "Error 10"
    case error21 = "Error 21"
    case error35 = "Error 35"
    case error75 = "Error 75"
    case error3004 = "Error 3004"
    case error3501 = "Error 3501"
    case error4005 = "Error 4005"
    case error4013 = "Error 4013"
    case error4014 = "Error 4014"
    case error4016 = "Error 4016"
    case error4042 = "Error 4042"
    
    // MARK: - Error problem
    
    var problem: String {
        switch self {
        case .error1:
            return "Trackpadi probleem"
        case .error6:
            return "SSD probleem"
        case .error9:
            return "BridgeOS probleem"
        case .error10:
            return "Kehv kaabel"
        case .error21:
            return "SoC ROM probleem"
        case .error35:
            return "Vedelikukahjustus"
        case .error75:
            return "Revive ebaõnnestus"
        case .error3004:
            return "Kehv internet"
        case .error3501:
            return "Ühenda toitekaabel"
        case .error4005:
            return "Emaplaadi viga"
        case .error4013:
            return "Emaplaadi viga"
        case .error4014:
            return "Vigane aku"
        case .error4016:
            return "Emaplaadi viga"
        case .error4042:
            return "Emaplaadi viga"
        }
    }

    // MARK: - Error image for illustration
    
    var imageName: String {
        switch self {
        case .error1:
            return "rectangle.and.hand.point.up.left"
        case .error6:
            return "externaldrive.trianglebadge.exclamationmark"
        case .error9:
            return "text.badge.xmark"
        case .error10:
            return "cable.connector"
        case .error21:
            return "cpu"
        case .error35:
            return "drop.halffull"
        case .error75:
            return "gear.badge.checkmark"
        case .error3004:
            return "wifi.slash"
        case .error3501:
            return "bolt.slash.fill"
        case .error4005:
            return "externaldrive.badge.questionmark"
        case .error4013:
            return "trash"
        case .error4014:
            return "gear.badge.xmark"
        case .error4016:
            return "battery.100percent.bolt"
        case .error4042:
            return "xmark.circle.fill"
        }
    }
    
    //MARK: - Error code possible reason
    
    var reason: String {
        switch self {
        case .error1:
            return "Trackpad ei ole tõenäoliselt ühendatud"
        case .error6:
            return "Tõenäoliselt on tegemist SSD rikkega - katsu kas NAND on soe"
        case .error9:
            return "BridgeOS partitsiooni ei leitud"
        case .error10:
            return "Halb või ebastabiilne ühendus"
        case .error21:
            return "Tõenäoliselt vigane SoC ROM"
        case .error35:
            return "Tõenäoliselt vedelikukahjustus ühel NANDi kivil"
        case .error75:
            return "T2 Bootis recoverysse ning restore ebaõnnestus"
        case .error3004:
            return "Halb või puuduv internetiühendus taastataval seadmel"
        case .error3501:
            return "Taastatav seade vajab lisatoidet"
        case .error4005:
            return "Ketast ei tuvastatud"
        case .error4013:
            return "Vead viitavad halvale NAND-süsteemi konfiguratsioonile"
        case .error4014:
            return "T2 RAM error"
        case .error4016:
            return "Vead viitavad halvale NAND-süsteemi konfiguratsioonile"
        case .error4042:
            return "Timeout error - T2 käivitab toitetsükli iga 20 sekundi tagant"
        }
    }
    
    //MARK: - Error suggestion
    
    var suggestion: String {
        switch self {
        case .error1:
            return "Kontrolli, kas trackpad on korralikult ühendatud ja töökorras."
        case .error6:
            return "Proovi kasutada Restore režiimi, mitte Revive režiimi."
        case .error9:
            return "Võimalik, et protsessori või RAM-i toiteahelas on talitlushäired. Ei ole välistatud, et ketta partitisooni ei leitud."
        case .error10:
            return "Proovi taastamise ajaks teist kaablit."
        case .error21:
            return "Kontrolli visuaalselt SoC ROMi ja selle ümbrust."
        case .error35:
            return "Proovi emaplaat puhtaks pesta ning seejärel testi testmasinas."
        case .error75:
            return "Kasuta Revive režiimi asemel Restore režiimi Apple configuratoris."
        case .error3004:
            return "Kontrolli Wi-Fi antenni klemme, vajadusel vaheta Wi-Fi antenn välja."
        case .error3501:
            return "Veendu, et toitekaabel oleks ühendatud, jälgi, et testeri järgi seade tarbiks."
        case .error4005:
            return "Kontrolli plaati visuaalselt ning veendu, et ei oleks vedelikukahjustust."
        case .error4013:
            return "Kontrolli plaati visuaalselt ning veendu, et ei oleks vedelikukahjustust."
        case .error4014:
            return "Antud viga võib põhjustada vigane aku, veendu aku korrasolekus."
        case .error4016:
            return "Kontrolli plaati visuaalselt ning veendu, et ei oleks vedelikukahjustust."
        case .error4042:
            return "Kontrolli plaati visuaalselt, et ei oleks vedelikukahjustust."
        }
    }
    
    //MARK: - Error solution
    
    var solution: String {
        switch self {
        case .error1:
            return "Vajadusel vaheta trackpad või trackpadi flex välja."
        case .error6:
            return "Kui peale seda endiselt sama siis läheb emaplaat elektroonikule"
        case .error9:
            return "Veendu, et heatsink oleks protsessoril peal ning ventilaatorid toimivad. Kui kõik toimib siis läheb emaplaat elektroonikule."
        case .error10:
            return "Veendu, et pesa on puhas ning toimib."
        case .error21:
            return "Potentsiaalselt on see lahendatav SoC ROM-i asendamisega."
        case .error35:
            return "Kui peale pesu ja testmasinas endiselt vigane siis elektroonikule."
        case .error75:
            return "Kui peale seda viga kordub siis emaplaat elektroonikule"
        case .error3004:
            return "Kui antenniga probleeme ei ole siis ühenda võrgukaabel ja proovi uuesti."
        case .error3501:
            return "Kui seade ei tarbi voolu siis on võimalik, et pesa ei toimi ning vajab elektroonikut."
        case .error4005:
            return "Kui plaat visuaalselt korras siis vii plaat elektroonikule"
        case .error4013:
            return "Kui plaat visuaalselt korras siis vii elektroonikule. Tõenäoliselt scrap"
        case .error4014:
            return "Kui aku on korras ning testidud siis vii plaat elektroonikule"
        case .error4016:
            return "Kui plaat visuaalselt korras siis vii elektroonikule. Tõenäoliselt scrap"
        case .error4042:
            return "Kui plaat visuaalselt korras siis on suure tõenäosusega SSD viga"
        }
    }
}

