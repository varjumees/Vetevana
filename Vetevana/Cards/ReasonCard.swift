//
//
// ReasonCard.swift
// Vetevana
//
// Created by varjumees on 06.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import SwiftUI

struct ReasonCard: View {
    let title: String
    let iconName: String
    let description: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
                .symbolRenderingMode(.multicolor)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
                
                Text(description)
                    .font(.body)
                    .fontWeight(.semibold)
            }
            
            Spacer()
        }
        .padding()

    }
}

#Preview {
    ReasonCard(title: "What to do?", iconName: "waterbottle", description: "Drink some water")
}
