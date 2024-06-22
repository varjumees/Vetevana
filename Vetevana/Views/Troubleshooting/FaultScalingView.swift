//
//
// FaultScalingView.swift
// Vetevana
//
// Created by varjumees on 06.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import SwiftUI
import SwiftData

struct FaultScalingView: View {
    let error: Error
    @State private var isHovering = false

    var body: some View {
            VStack(alignment: .center) {
                Group {
                    Image(systemName: error.imageName)
                        .foregroundStyle(.primary)
                        .font(.largeTitle)
                        .symbolRenderingMode(.multicolor)
                }
            }
        
        .scaleEffect(x: isHovering ? 1.5 : 1, y: isHovering ? 1.5 : 1)
        .onHover { isHovering in
            withAnimation(.spring(duration: 0.5)) {
                self.isHovering = isHovering
            }
        }
    }
}

