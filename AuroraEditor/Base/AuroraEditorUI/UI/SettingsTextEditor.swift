//
//  SettingsTextEditor.swift
//  Aurora Editor
//
//  Created by Andrey Plotnikov on 07.05.2022.
//  Copyright © 2023 Aurora Company. All rights reserved.
//
//  This file originates from CodeEdit, https://github.com/CodeEditApp/CodeEdit

import Foundation
import SwiftUI

public struct SettingsTextEditor: View {
    @Binding
    var text: String

    @State
    private var isFocus: Bool = false

    public init(text: Binding<String>) {
        self._text = text
    }

    public var body: some View {
        Representable(text: $text, isFocused: $isFocus)
            .overlay(focusOverlay)
    }

    private var focusOverlay: some View {
      Rectangle().stroke(Color.accentColor.opacity(isFocus ? 0.4 : 0), lineWidth: 2)
    }
}

private extension SettingsTextEditor {
    struct Representable: NSViewRepresentable {

        @Binding var text: String
        @Binding var isFocused: Bool

        func makeNSView(context: Context) -> NSScrollView {
            let scrollView = NSTextView.scrollableTextView()
            scrollView.verticalScroller?.alphaValue = 0
            let textView = scrollView.documentView as? NSTextView
            textView?.backgroundColor = .windowBackgroundColor
            textView?.isEditable = true
            textView?.delegate = context.coordinator
            textView?.string = text
            return scrollView
        }

        func updateNSView(_ nsView: NSScrollView, context: Context) {

        }

        func makeCoordinator() -> Coordinator {
            Coordinator(parent: self)
        }

        class Coordinator: NSObject, NSTextViewDelegate {
            var parent: Representable

            init(parent: Representable) {
                self.parent = parent
            }

            func textDidBeginEditing(_ notification: Notification) {
                parent.isFocused = true
            }

            func textDidEndEditing(_ notification: Notification) {
                parent.isFocused = false
            }

            func textDidChange(_ notification: Notification) {
                guard let textView = notification.object as? NSTextView else {
                    return
                }
                // Update text
                self.parent.text = textView.string
            }
        }
    }

}
