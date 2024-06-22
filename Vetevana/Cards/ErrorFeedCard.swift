//
//
// ErrorFeedCard.swift
// Vetevana
//
// Created by varjumees on 06.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        
/*
import SwiftUI
import SwiftData
import VetevanaData

struct ErrorFeedCard: View {
    @Query private var errors: [Error]
    
    var navigation: HomeCardHeaderNavigation = .navigationLink
    
    var body: some View {
        VStack {
            CardNavigationHeader(panel: .errors, cardNavigation: navigation) {
                Label("DFU veakoodid", systemImage: "exclamationmark.bubble")
            }
            
            FlowLayout(alignment: .center) {
                ForEach(errors) { error in
                    HStack {
                        Image(systemName: error.imageName)
                            .foregroundStyle(.primary)
                            .symbolRenderingMode(.multicolor)
                        Text(error.id)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(8)
                }
            }
            #if canImport(UIKit)
            .backgroundStyle(Color(uiColor: .quaternarySystemFill))
            #else
            .backgroundStyle(.quaternary.opacity(0.5))
            #endif
            .frame(maxWidth: .infinity, minHeight: 180)
            .padding(.top, 15)
            
            Text("Teadaolevad veakoodid")
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            Spacer()
        }
        .padding(10)
        .background()
    }
}
*/
