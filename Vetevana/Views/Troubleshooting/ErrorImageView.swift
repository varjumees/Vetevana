//
//
// ErrorImageView.swift
// Vetevana
//
// Created by varjumees on 06.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import SwiftUI
import SwiftData

struct FaultImageView: View {
    let error: Error

    var body: some View {
            HStack {
                Group {
                    Image(systemName: error.imageName)
                        .foregroundStyle(.primary)
                        .symbolRenderingMode(.multicolor)
                }
            }
    }
}
