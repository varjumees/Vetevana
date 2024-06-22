//
//
// AccountNavigationStack.swift
// Vetevana
//
// Created by varjumees on 04.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
/*
import SwiftUI
import SwiftData

struct AccountNavigationStack: View {
    @Query private var accounts: [Account]
    @State private var presentingEditAccountSheet = false
    
    
    var body: some View {
        NavigationStack {
            if let account = accounts.first {
                Form {
                    VStack {
                        Text(account.displayName)
                            .font(.headline.bold())
                            .overlay(alignment: .leading) {
                                    Label("Standard Member", systemImage: "laptopcomputer")
                                .foregroundStyle(.tint)
                                .labelStyle(.iconOnly)
                                .imageScale(.large)
                                .alignmentGuide(.leading) { $0[.trailing] + 4 }
                            }
                        
                        Text("Joined \(account.joinDate.formatted(.dateTime.month(.wide).day(.twoDigits).year()))",
                             comment: "Variable is the calendar date when the person joined.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .listRowInsets(.none)
                    .listRowBackground(Color.clear)
                }
                .formStyle(.grouped)
                .navigationTitle("Account")
                .toolbar {
                    Button {
                        presentingEditAccountSheet = true
                    } label: {
                        Label("Edit Account", systemImage: "pencil")
                    }
                }
                .sheet(isPresented: $presentingEditAccountSheet) {
                    EditAccountForm(account: account)
                }
            } else {
                ContentUnavailableView("No Account Found", systemImage: "bird")
            }
        }
    }
}

/*
 #Preview {
    AccountNavigationStack()
        .vetevanaDataContainer(inMemory: true)
}
*/
*/
