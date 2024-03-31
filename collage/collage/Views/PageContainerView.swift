//
//  PageContainerView.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//
//
//import SwiftUI
//

import SwiftUI

/// A container for card content
struct PageContainerView<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
            content
                .foregroundStyle(Color.cardText)
        }
        .aspectRatio(0.75, contentMode: .fit)
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
