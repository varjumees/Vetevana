//
//
// ErrorGalleryView.swift
// Vetevana
//
// Created by varjumees on 06.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import SwiftUI
import SwiftData

struct ErrorGalleryView: View {
    @Query(sort: \Error.problem, order: .forward) // Use .problem for sorting
       private let errors: [Error]

    @State private var vigadeSheetNähtav = false // Move here for sheet control
    @State private var valitudError: Error? = nil //
    @State private var sortOrder = FaultSortOrder.name
    @State private var selection = Set<Error.ID>()
    @State private var searchText = ""

    var filteredErrors: [Error] {
        errors.filter {
            searchText.isEmpty ||
            $0.id.localizedCaseInsensitiveContains(searchText) ||
            $0.problem.localizedCaseInsensitiveContains(searchText)
        }
        .sorted {
            switch sortOrder {
            case .name: return $0.problem.localizedCompare($1.problem) == .orderedAscending
            case .id:   return $0.id.localizedCompare($1.id) == .orderedAscending
            case .solution: return $0.solution.localizedCompare($1.solution) == .orderedAscending
            }
        }
    }
    
    var body: some View {
        ZStack {
            if errors.isEmpty, !searchText.isEmpty {
                Text("Ei leitud veakoode")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding()
            } else {
                GeometryReader { geometryProxy in
                    ScrollView {
                        SingleErrorView(
                            errors: filteredErrors,
                            width: geometryProxy.size.width,
                            selectedError: $valitudError,
                            searchText: $searchText
                        )
                    }
                }
            }
        }
        
        
        .background(.quaternary.opacity(0.5))
        .background()
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                toolbarItems
            }
        }
        
        .sheet(item: $valitudError) { error in
            FaultSheetView(error: error) // Remove the isPresented binding
        }
        .searchable(text: $searchText)
        .navigationTitle("Restore veakoodid")
    }
    
    @ViewBuilder
    var toolbarItems: some View {
        Menu {
            Picker("Sort", selection: $sortOrder) {
                ForEach(FaultSortOrder.allCases) { option in // Use allCases for the Picker
                    Text(option.rawValue)
                        .tag(option)
                }
            }
            .pickerStyle(.inline)
        } label: {
            Label("Change the item grouping", systemImage: "square.grid.3x1.below.line.grid.1x2")
                .labelStyle(.iconOnly)
        }	
    }
}

enum FaultSortOrder: String, CaseIterable, Identifiable {
    case name = "Nimetus"
    case id = "Veakood"
    case solution = "Lahendus"

    public var id: Self { self }

    var systemImageName: String {
        switch self {
        case .name, .solution: return "textformat"
        case .id: return "number"
        }
    }
}

#Preview(traits: .previewData) {
    ErrorGalleryView()
}
