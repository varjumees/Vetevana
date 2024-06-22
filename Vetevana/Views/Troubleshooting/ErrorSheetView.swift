//
//
// ErrorSheetView.swift
// Vetevana
//
// Created by varjumees on 06.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//


import SwiftUI
import SwiftData

struct FaultSheetView: View {
    let error: Error?  // Make error optional

    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        if let error = error {  // Unwrap error safely
            VStack(spacing: 10) {
                Text(error.id)
                    .font(.largeTitle)     // More prominent
                    .bold()
                    .padding(.top, 60)

                Text(error.reason)
                    .padding(.bottom, 30)
                    
                ReasonCard(title: "Mida teha?", iconName: "questionmark.circle",
                           description: error.suggestion)
                
                ReasonCard(title: "Mis on lahendus?", iconName: "checkmark", description: error.solution)
                
                Spacer()
                Image(systemName: "doc.on.doc")
                    .font(.title2)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.blue)
                Text("Kui Apple Configuratoriga seadme taastamine ebaõnnestub, kuvatakse veakood, mis identifitseerib taastamise ajal tekkinud probleemi. Veakoodid võivad varieeruda sõltuvalt taastamise põhjusest ja seadme seisundist.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 40)
                    .padding(.horizontal, 50)
                Button(action: {
                    dismiss()
                }) {
                    Text("Sulge")
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding(.horizontal, 50)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            .padding()
            .frame(width: 480, height: 600)
        } else {
            // Handle the case where error is nil (e.g., show a "No Error Selected" message)
            Text("No Error Selected")
                .font(.headline)
        }
    }
}
