//
//  StatusBarToggleDrawerButton.swift
//  Aurora Editor
//
//  Created by Lukas Pistrol on 22.03.22.
//  Copyright © 2023 Aurora Company. All rights reserved.
//
//  This file originates from CodeEdit, https://github.com/CodeEditApp/CodeEdit

import SwiftUI

internal struct StatusBarToggleDrawerButton: View {
    @ObservedObject
    private var model: StatusBarModel

    internal init(model: StatusBarModel) {
        self.model = model
    }

    internal var body: some View {
        Button {
            withAnimation {
                model.isExpanded.toggle()
                if model.isExpanded && model.currentHeight < 1 {
                    model.currentHeight = 300
                }
            }
            // Show/hide terminal window
        } label: {
            Image(systemName: "rectangle.bottomthird.inset.filled")
                .imageScale(.medium)
        }
        .tint(model.isExpanded ? .accentColor : .primary)
        .keyboardShortcut("Y", modifiers: [.command, .shift])
        .buttonStyle(.borderless)
        .onHover { isHovering($0) }
    }
}
