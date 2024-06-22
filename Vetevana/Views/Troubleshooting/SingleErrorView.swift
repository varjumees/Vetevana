//
//
// SingleErrorView.swift
// Vetevana
//
// Created by varjumees on 06.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import SwiftUI
import SwiftData

struct SingleErrorView: View {
    var errors: [Error]         // Receive errors from the parent view
    var width: Double
    @Binding var selectedError: Error?
    @Binding var searchText: String // Use @Binding for searchText

    let iconShape = RoundedRectangle(cornerRadius: 10, style: .continuous)
    @State private var vigadeSheetNähtav = false
    @State private var valitudError: Error? = nil

    private var filteredErrors: [Error] {
        if searchText.isEmpty {
            return errors
        } else {
            return errors.filter { error in
                // Use properties from the Error model
                error.id.localizedCaseInsensitiveContains(searchText) ||
                error.reason.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
   
    
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var sizeClass
#endif
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    var useReducedThumbnailSize: Bool {
#if os(iOS)
        if sizeClass == .compact {
            return true
        }
#endif
        if dynamicTypeSize >= .xxxLarge {
            return true
        }
        
#if os(iOS)
        if width <= 390 {
            return true
        }
#elseif os(macOS)
        if width <= 520 {
            return true
        }
#endif
        
        return false
    }
    
    var cellSize: Double {
        useReducedThumbnailSize ? 100 : 150
    }
    
    var thumbnailSize: Double {
#if os(iOS)
        return useReducedThumbnailSize ? 60 : 100
#else
        return useReducedThumbnailSize ? 40 : 80
#endif
    }
    
    var gridItems: [GridItem] {
        [GridItem(.adaptive(minimum: cellSize), spacing: 20, alignment: .top)]
    }
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 20) {
            ForEach(filteredErrors) { error in
                VStack {
                    FaultScalingView(error: error)
                        .frame(width: thumbnailSize, height: thumbnailSize)
                    
                    Text(error.id)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Text("\(error.problem)")
                        .font(.headline)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                    
                }
                .frame(width: 140, height: 120)
                
                .padding(6)
#if canImport(UIKit)
                .background(Color(uiColor: .tertiarySystemFill), in: iconShape)
#else
                .background(in: iconShape)
#endif
                .overlay {
                    iconShape.strokeBorder(.quaternary, lineWidth: 0.5)
                }
                .onTapGesture {
                    selectedError = error // Set the selected error
                }
                .sheet(isPresented: $vigadeSheetNähtav) {
                    // Pass the unwrapped error directly to the sheet
                    if let error = valitudError {
                        FaultSheetView(error: error)
                    }
                }
                
            }
        }
        .padding()
    }
}

