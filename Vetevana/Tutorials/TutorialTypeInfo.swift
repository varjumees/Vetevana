//
//
// TutorialData+DataGeneration.swift
//
//
// Created by varjumees on 04.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import Foundation
import SwiftData

public struct TutorialTypeInfo: RawRepresentable, Hashable, CaseIterable, Codable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
  
    public static var allCases: [TutorialTypeInfo] = [
        .setup, .removal, .preparation
    ]
    
    public static let setup = Self(rawValue: "Tutorial 1")
    public static let removal = Self(rawValue: "Tutorial 2")
    public static let preparation = Self(rawValue: "Tutorial 3")

    public var steps: [Step] {
        switch self {
        case .setup:
            return [
                Step(title: "Ühenda kuumaõhujaam vooluvõrku", instruction: "Veendu, et kuumaõhujaama paigutus ei oleks tuleohtlik. Jälgi, et puhuri ots ei puutuks kuhugi vastu.", image: "power.circle"),
                
                Step(title: "Pane paika kuumapuhuri temperatuur", instruction: "Teoorias on 300°C ideaalne, kuid meie puhurite puhul on 450°C õige temperatuur.", image: "thermometer.sun"),
                
                Step(title: "Vali kuumapuhurile õige kiirus", instruction: "Liiga madal kiirus ei pruugi ilusti kogu tina üles sulatada. Liiga suur kiirus võib muudele koponentidele liiga teha", image: "gauge.with.dots.needle.67percent")
            ]
            
            
        case .removal:
            return [
                Step(title: "Lisa fluxi", instruction: "Lisa fluxi ümber kivi, et kiirendada tina sulamist ja hõlbustada kivi eemaldamist. Kindlasti kasuta kindaid!", image: "hand.raised.fingers.spread"),
                Step(title: "Kuumuta eemaldatavat kiipi", instruction: "Jälgi läbi mikroskoobi, et flux mullitaks ning proovi õrnalt pintsettidega kivi kergitada.", image: "flame"),
                Step(title: "Eemalda kivi emaplaadilt", instruction: "Kui tunned, et kivi on vaba ning tina on sulanud siis ettevaatlikult tõsta kivi emaplaadilt üles.", image: "arrow.up.circle")
            ]
            
        case .preparation:
            return [
                Step(title: "Puhasta kivi IPA-ga", instruction: "Veendu, et kontaktid on fluxist puhtad, et vältida programmeerija määrdumist.", image: "waterbottle"),
                Step(title: "Sisesta puhastatud kivi lugejasse", instruction: "Sea kohakuti valge täpp programmeerijal ning valge täpp kivil.", image: "dock.arrow.down.rectangle"),
                Step(title: "Ühenda programmeerija", instruction: "Võta üldlaualt vana Retina, millel windows peal ning ühenda sellega programmeerija.", image: "cable.connector")
            ]
        default:
            fatalError("Unknown tutorial type: \(self.rawValue)")
        }
    }
}
