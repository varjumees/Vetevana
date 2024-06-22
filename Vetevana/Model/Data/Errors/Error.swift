//
//
//  Error.swift
//
//
//  Created by varjumees on 22.06.2024.
//  Copyright © 2024 varjumees. All rights reserved.
//
//

import SwiftUI
import SwiftData

@Model class Error {
    @Attribute(.unique) var id: String // Unique identifier (error code)
    let problem: String // Error Title
    let imageName: String // Image name for the icon
    let reason: String // Suggested solution for the error
    let suggestion: String
    let solution: String

    init(id: String, problem: String, imageName: String, reason: String, suggestion: String, solution: String) {
        self.id = id
        self.problem = problem
        self.imageName = imageName
        self.reason = reason
        self.suggestion = suggestion
        self.solution = solution
    }
}
