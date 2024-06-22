
import SwiftUI
import SwiftData

@Model
final class Tag: Identifiable {
    @Relationship
    var tips: [Tip]
    
    @Relationship
    var icon: TagIcon
    
    var id: Int
    var name: String
    
    init(
        id: Int,
        name: String,
        tips: [Tip] = [],
        icon: TagIcon
    ) {
        self.tips = tips
        self.id = id
        self.name = name
        self.icon = icon
    }
}

extension Tag {
    var localizedName: String {
        String(localized: LocalizedStringResource(stringLiteral: self.name))
    }
    
    @ViewBuilder
    var label: some View {
        Label {
            Text(name)
        } icon: {
            Image(systemName: icon.icon)
        }
    }
}

extension TipData {
    @MainActor static let tags = [
        // MARK: - Model numbers
        Tag(id: 0, name: "A1534", icon: .tag),
        Tag(id: 1, name: "A2179", icon: .tag),
        Tag(id: 2, name: "A1708", icon: .tag),
        Tag(id: 3, name: "A1990", icon: .tag),
        Tag(id: 4, name: "A1706", icon: .tag),
        Tag(id: 5, name: "A1989", icon: .tag),
        Tag(id: 6, name: "A2251", icon: .tag),
        Tag(id: 7, name: "A2159", icon: .tag),
        Tag(id: 8, name: "A1707", icon: .tag),
        
        // MARK: - Devices
        Tag(id: 9, name: "12-tolli Macbook", icon: .laptop),
        Tag(id: 10, name: "13-tolli Macbook Pro (2016-2017)", icon: .laptop),
        Tag(id: 11, name: "15-tolli MacBook Pro (2016-2019)", icon: .laptop),
        Tag(id: 12, name: "16-tolli MacBook Pro (2019)", icon: .laptop),
        
        Tag(id: 13, name: "MacBook Air A2681", icon: .laptop),
        Tag(id: 14, name: "MacBook Air A2941", icon: .laptop),
        Tag(id: 15, name: "MacBook Air A1932", icon: .laptop),
        Tag(id: 16, name: "MacBook Air A2179", icon: .laptop),
        Tag(id: 17, name: "MacBook Air A2337", icon: .laptop),
        
        Tag(id: 18, name: "MacBook Air 2018", icon: .laptop),
        Tag(id: 19, name: "MacBook Air 2019", icon: .laptop),
        Tag(id: 20, name: "MacBook Air 2020", icon: .laptop),
        Tag(id: 21, name: "MacBook Air 2018-2020", icon: .laptop),
        Tag(id: 22, name: "MacBook Air 2020 M1", icon: .laptop),
        
        // MARK: - Motherboards
        Tag(id: 23, name: "820-01124", icon: .cpu),
        Tag(id: 24, name: "820-01521", icon: .cpu),
        Tag(id: 25, name: "820-01958", icon: .cpu),
        Tag(id: 26, name: "820-02016", icon: .cpu),
        Tag(id: 27, name: "820-01958", icon: .cpu),
        
        // MARK: - Spare parts and ADP
        Tag(id: 28, name: "Angle sensor (661-26216)", icon: .tag),
        Tag(id: 29, name: "Angle sensor (661-34699)", icon: .tag),
        Tag(id: 30, name: "Angle sensor (661-14647)", icon: .tag),
        Tag(id: 31, name: "I/O Flex Cable (923-02812)", icon: .tag),
        Tag(id: 32, name: "Audio board flex cable (923-03663)", icon: .tag),
        Tag(id: 33, name: "Apple Diagnostics - ALS001", icon: .check),
        
        // MARK: - Muu
        Tag(id: 34, name: "Early 2015", icon: .calendar),
        Tag(id: 35, name: "2016-2017", icon: .calendar),
        Tag(id: 36, name: "2018-2019", icon: .calendar),
        Tag(id: 37, name: "2TBT", icon: .tag),
        Tag(id: 38, name: "Apple Diagnostics - ADP000", icon: .check),
        Tag(id: 39, name: "Kõik T2 seadmed", icon: .laptop),
        Tag(id: 40, name: "13-tolli Macbook Pro (2016-2020)", icon: .laptop)
    ]
}
