






import Foundation
import SwiftUI

struct TipData {}

extension TipData {
    @MainActor static let content = [
        
        // MARK: - MacBook 12"
        Tip(
            id: 0,
            name: "No power, mis viitab CPU probleemile. Esialgu proovida reflow, kui peale seda sama siis scrap.",
            imageName: "memorychip",
            category: .macbook
        ),
        Tip(
            id: 1,
            name: "Seade käivitub, kuid trackpad ei kliki - vigane audio board või lintkaabel tagurpidi.",
            imageName: "moon.zzz.fill",
            category: .macbook
        ),
        Tip(
            id: 2,
            name: "Heli puudub, kuid raudvara näeb - vigane audio board.",
            imageName: "speaker.wave.2",
            category: .macbook
        ),
        Tip(
            id: 3,
            name: "Trackpadi veaga kontrolli lintkaablit - kergesti purunev põhjakaant avades",
            imageName: "rectangle.and.hand.point.up.left",
            category: .macbook
        ),
        
        // MARK: - MacBook Air
        Tip(
            id: 4,
            name: "Vigane Angle Sensor kaotab ekraani taustavalguse ja trackpadi funktsionaalsuse.",
            imageName: "moon.zzz.fill",
            category: .macbookAir
        ),
        Tip(
            id: 5,
            name: "Vigane audio boardi poolne kõlar ei too tagasi ekraani taustavalgust peale kaane sulgemist.",
            imageName: "speaker.wave.2.fill",
            category: .macbookAir
        ),
        Tip(
            id: 6,
            name: "Vigane aku põhjustab MacBook Air seadmel boot errorit.",
            imageName: "battery.100percent",
            category: .macbookAir
        ),
        Tip(
            id: 7,
            name: "Vedelikukahjustus Audio boardi ja selle lintkaabli vahel muudab seadme no poweriks",
            imageName: "bolt.trianglebadge.exclamationmark.fill",
            category: .macbookAir
        ),
        Tip(
            id: 8,
            name: "Põlenud kaamera drossel põhjustab cam issuet",
            imageName: "video.slash",
            category: .macbookAir
        ),
        Tip(
            id: 9,
            name: "No power Air, millel on kuulda klõpsuvat protsessorit on automaatselt scrap.",
            imageName: "cpu.fill",
            category: .macbookAir
        ),
        
        // MARK: - MacBook Pro
        Tip(
            id: 10,
            name: "Boot Error/Black Dull screen - DFU restore või uus angle sensor.",
            imageName: "tv.slash",
            category: .macbookPro
        ),
        Tip(
            id: 11,
            name: "Ketas ei tule nähtavale - kõvaketas tuleb välja vahetada",
            imageName: "questionmark.folder",
            category: .macbookPro
        ),
        Tip(
            id: 12,
            name: "Critical update failed - partitsioon puudub või vigane Touch Bar.",
            imageName: "hand.point.up.braille",
            category: .macbookPro
        )
    ]
}
