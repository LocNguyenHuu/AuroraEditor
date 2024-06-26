//
//  StatusBarMenuLabel.swift
//  Aurora Editor
//
//  Created by Axel Zuziak on 24.04.2022.
//  Copyright © 2023 Aurora Company. All rights reserved.
//
//  This file originates from CodeEdit, https://github.com/CodeEditApp/CodeEdit

import SwiftUI

/// A view that displays Text with custom chevron up/down symbol
internal struct StatusBarMenuLabel: View {
    private let text: String

    @ObservedObject
    private var model: StatusBarModel

    internal init(_ text: String, model: StatusBarModel) {
        self.text = text
        self.model = model
    }

    internal var body: some View {
        Text(text + "  ")
            .font(model.toolbarFont) +
        Text(Image.customChevronUpChevronDown)
            .font(model.toolbarFont)
    }
}
