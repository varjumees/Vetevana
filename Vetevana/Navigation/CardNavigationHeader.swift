//
//
//  CardNavigationHeader.swift
//
//
//  Created by varjumees on 23.06.2024.
//  Copyright © 2024 varjumees. All rights reserved.
//
//

import SwiftUI

struct CardNavigationHeader<Destination: View, Label: View>: View { // Add Destination generic type
    var destination: Destination
    var cardNavigation: HomeCardHeaderNavigation
    @ViewBuilder var label: Label
    
    var body: some View {
        HStack {
            switch cardNavigation {
            case .navigationLink:
                NavigationLink(destination: destination) {
                    label
                }
            case .selection(let selection):
                Button {
                    selection.wrappedValue = destination as? Tabs
                } label: {
                    label
                }
            }
            
            Spacer()
        }
        .buttonStyle(.borderless)
        .labelStyle(.cardNavigationHeader)
    }
}

enum HomeCardHeaderNavigation {
    case navigationLink
    case selection(Binding<Tabs?>)
}
