//
//  EditorToolbar.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

import SwiftUI

struct EditorToolbar: ToolbarContent {
    let isEnabled: Bool
    @Binding var editing: Bool

    var body: some ToolbarContent {
        ToolbarItem {
            if Design.editFeatureEnabled {
                Button {
                    editing.toggle()
                } label: {
                    Image(systemName: editing ? "play" : "pencil" )
                }
                .disabled(!isEnabled)
            } else {
                EmptyView()
            }
        }
    }
}
