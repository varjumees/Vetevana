//
//
// EditAccountForm.swift
// Vetevana
//
// Created by varjumees on 04.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import OSLog
import SwiftUI
import SwiftData



struct EditAccountForm: View {
    var account: Account
    
    @State private var email: String = ""
    @State private var displayName: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("Display Name", text: $displayName)
                        #if os(iOS)
                        .textInputAutocapitalization(.words)
                        #endif
                        .disableAutocorrection(true)
                        .textContentType(.name)
                        .onSubmit {
                            logger.info("Requesting to change displayName to \(displayName)")
                            account.displayName = displayName
                        }
                        .onAppear {
                            displayName = account.displayName
                        }
                }
                
                Section("Email") {
                    TextField("Email Address", text: $email)
                        #if os(iOS)
                        .textInputAutocapitalization(.never)
                        #endif
                        .disableAutocorrection(true)
                        .textContentType(.emailAddress)
                        .onSubmit {
                            logger.info("Requesting to change email to \(email)")
                            account.emailAddress = email
                        }
                        .onAppear {
                            email = account.emailAddress
                        }
                }
            }
            .formStyle(.grouped)
            .navigationTitle("Account Information")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            #if !os(iOS)
            .frame(minWidth: 440, maxWidth: .infinity, minHeight: 220, maxHeight: .infinity)
            #endif
        }
    }
}

/*
#Preview {
    ModelPreview { account in
        EditAccountForm(account: account)
    }
}
*/
