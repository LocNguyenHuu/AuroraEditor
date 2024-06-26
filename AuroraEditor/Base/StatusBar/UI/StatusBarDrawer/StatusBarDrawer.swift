//
//  StatusBarDrawer.swift
//  Aurora Editor
//
//  Created by Lukas Pistrol on 22.03.22.
//  Copyright © 2023 Aurora Company. All rights reserved.
//
//  This file originates from CodeEdit, https://github.com/CodeEditApp/CodeEdit

import SwiftUI

internal struct StatusBarDrawer: View {
    @ObservedObject
    private var model: StatusBarModel

    @State
    private var searchText = ""

    internal init(model: StatusBarModel) {
        self.model = model
    }

    var height: CGFloat {
        if model.isMaximized {
            return model.maxHeight
        }
        if model.isExpanded {
            return model.currentHeight
        }
        return 0
    }

    internal var body: some View {
        VStack(spacing: 0) {
            switch model.selectedTab {
            case 0: TerminalEmulatorView(url: model.workspaceURL)
            default: Rectangle().foregroundColor(Color(nsColor: .textBackgroundColor))
            }
            HStack(alignment: .center, spacing: 10) {
                FilterTextField(title: "Filter", text: $searchText)
                    .frame(maxWidth: 300)
                Spacer()
                StatusBarClearButton(model: model)
                Divider()
                StatusBarSplitTerminalButton(model: model)
                StatusBarMaximizeButton(model: model)
            }
            .padding(10)
            .frame(maxHeight: 29)
            .background(.bar)
        }
        .frame(minHeight: 0,
               idealHeight: height,
               maxHeight: height)
    }
}
