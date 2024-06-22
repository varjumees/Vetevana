//
//
// test.swift
// Vetevana
//
// Created by varjumees on 05.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        
import SwiftUI
import SwiftData


struct ErrorListView: View {
    @Query var errors: [Error] = []

    var body: some View {
        NavigationStack { // Add NavigationStack
            Form {
                ForEach(errors) { error in
                    NavigationLink(destination: ErrorDetailView(error: error)) {
                        ErrorRow(error: error)
                            .buttonStyle(.plain)
                    }
                }
            }
            .formStyle(.grouped)
            .navigationTitle("Veakoodid")
        }
    }
}

struct ErrorRow: View {
    var error: Error

    var body: some View {
        HStack {
            Image(systemName: error.imageName)
                .foregroundStyle(.primary)

            VStack(alignment: .leading) {
                Text(error.problem)
                    .font(.headline)
                Text(error.reason)
            }
        }
    }
}
struct ErrorDetailView: View {
    var error: Error

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(systemName: error.imageName)
                    .font(.largeTitle)
                    .foregroundStyle(.primary)
                Text(error.problem)
                    .font(.title)
                    .padding(.bottom)

                Text("Põhjus:")
                    .font(.headline)
                Text(error.reason)
                    .padding(.bottom)

                Text("Soovitus:")
                    .font(.headline)
                Text(error.suggestion)
                    .padding(.bottom)

                Text("Lahendus:")
                    .font(.headline)
                Text(error.solution)
            }
            .padding()
        }
        .navigationTitle(error.problem)
    }
}

#Preview {
    ErrorListView()
}
