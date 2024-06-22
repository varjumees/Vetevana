//
//
// TestView.swift
// Vetevana
//
// Created by varjumees on 05.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        
/*
import SwiftUI
import SwiftData

struct TutorialView: View {
    @Query(sort: \Tutorial.title) var tutorials: [Tutorial]

    var body: some View {
        NavigationStack {
            List(tutorials) { tutorial in
                NavigationLink(destination: TutorialDetailView(tutorial: tutorial)) {
                    VStack(alignment: .leading) {
                        Text(tutorial.title)
                            .font(.headline)
                        Text(tutorial.subTitle)
                    }
                }
            }
            .navigationTitle("Tutorials")
        }
    }
}

struct TutorialDetailView: View {
    var tutorial: Tutorial
    @State private var showFinishConfirmation = false
    @State private var isCompleted = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image(systemName: tutorial.imageName)
                    .font(.system(size: 70))
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .symbolRenderingMode(.multicolor)
                    .contentTransition(.symbolEffect(.replace.upUp.byLayer))

                Text(tutorial.title)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .padding(.bottom)
                    .transition(.slide)
                    .padding(.bottom, 40)

                ForEach(tutorial.steps) { step in // Access steps from TutorialTypeInfo
                    StepView(step: step)
                }
                HStack {
                    Spacer()
                    Button("Valmis") {
                        showFinishConfirmation = true
                    }
                    .padding()
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle(tutorial.title)
        .confirmationDialog("Oled kindel, et kõik on arusaadav?", isPresented: $showFinishConfirmation) {
            Button("Just nii") {
                // Update the 'completed' status of the tutorial in SwiftData
                presentationMode.wrappedValue.dismiss()
            }
            Button("Tühista", role: .cancel) { }
        }
    }
}

struct StepView: View {
     var step: Step

    var body: some View {
        HStack {
            Image(systemName: step.isCompleted ? "checkmark.circle" : step.image)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
                .symbolRenderingMode(.multicolor)
                .contentTransition(.symbolEffect(.replace.downUp.byLayer))
            
            VStack(alignment: .leading) {
                Text(step.title)
                    .font(.title3)
                
                Text(step.instruction)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.quaternary)
                .opacity(0.85)
        }
    }
}
*/
