//
//  PageView.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

import SwiftUI

struct FlashCardView: View {
    @State private var flipped = false
    var front: Angle { flipped ? .degrees(180) : .degrees(0) }
    var back: Angle { flipped ? .degrees(0) : .degrees(-180) }
    var page: Page

    var body: some View {
        Button {
            withAnimation { flipped.toggle() }
        } label: {
            VStack {
                #if !os(tvOS)
                Spacer(minLength: 0)
                #endif 
                ZStack {
                    PageReaderView(color: .cardFront, text: page.elements[0].name)
                        .horizontalFlip(front, visible: !flipped)
                }
                #if !os(tvOS)
                Spacer(minLength: 0)
                #endif
            }
        }
        .buttonStyle(Design.carouselCardButtonStyle)
        .focusEffectDisabled()
        .padding(.horizontal, Design.carouselCardHorizontalPadding)
    }
}
