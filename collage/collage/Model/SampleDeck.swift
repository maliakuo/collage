//
//  SampleDeck.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

//struct SampleDeck {
//    static var contents: [Page] = [
//        Page(front: "Open Settings in a single click", back: "SettingsLink"),
//        Page(front: "Configure the toolbar title display size", back: "toolbarTitleDisplayMode(_:)"),
//        Page(front: "Access both the old and new values that changed", back: "onChange(of:initial:_:)"),
//        Page(front: "Standard UI to replace unavailable View content", back: "ContentUnavailableView"),
//        Page(front: "View displaying details of selected content", back: "inspector(isPresented:content:)"),
//        Page(front: "Run an animation with a completion handler", back: "withAnimation(_:completionCriteria:_:completion:)"),
//        Page(front: "Create high-performance graphics by drawing with Metal shaders", back: "Shader"),
//        Page(front: "Set the background of a container view", back: "containerBackground(_:for:)"),
//        Page(front: "Customize table column visibility and reordering", back: "TableColumnCustomization"),
//        Page(front: "Disable selectability of an item in a List or Table", back: "selectionDisabled(_:)"),
//        Page(front: "Create paged scroll views", back: "scrollTargetBehavior(_:)")
//    ]
//}

import SwiftUI
import CoreGraphics

struct SampleDeck {
    static var contents: [Page] = [
//        Page(elements: [Element(name: "hi", position: CGPoint(x: 300, y: 200), isActive: false)])
        Page(elements: [Element(name: "hi", x: 120, y: 120, isActive: false, bold: false, italic: false, fx: 120, fy: 120)])
    ]
}
