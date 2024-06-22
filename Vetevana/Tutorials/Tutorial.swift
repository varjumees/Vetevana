//
//
// Tutorial.swift
//
//
// Created by varjumees on 04.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import Observation
import Foundation
import SwiftData
import OSLog


@Model public class Tutorial {
    @Attribute(.unique) public var id: String
    public let title: String
    public var subTitle: String
    public var imageName: String
    public var steps: [Step]
        
    public init(type: TutorialTypeInfo, title: String, subTitle: String, imageName: String) {
        self.id = type.rawValue
        self.title = title
        self.subTitle = subTitle
        self.imageName = imageName
        self.steps = type.steps
    }
}
