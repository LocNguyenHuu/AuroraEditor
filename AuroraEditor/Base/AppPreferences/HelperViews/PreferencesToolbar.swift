//
//  SwiftUIView.swift
//  Aurora Editor
//
//  Created by Lukas Pistrol on 13.04.22.
//  Copyright © 2023 Aurora Company. All rights reserved.
//
//  This file originates from CodeEdit, https://github.com/CodeEditApp/CodeEdit

import SwiftUI

struct PreferencesToolbar<T: View>: View {

    private let height: Double
    private let content: () -> T

    init(
        height: Double = 27,
        bgColor: Color = Color(NSColor.controlBackgroundColor),
        @ViewBuilder content: @escaping () -> T
    ) {
        self.height = height
        self.content = content
    }

    var body: some View {
        ZStack {
            EffectView(.contentBackground)
            HStack {
                content()
                    .padding(.horizontal, 8)
            }
        }
        .frame(height: height)
    }
}
