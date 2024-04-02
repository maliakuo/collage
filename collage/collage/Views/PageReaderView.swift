//
//  CardReaderView.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

import SwiftUI

struct PageReaderView: View {
    let color: Color
    let text: String
    var displaysCode: Bool = false

    var body: some View {
        PageContainerView {
            Text(text)
                .font(Design.cardViewingFont)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.33)
                .padding()
                .fontDesign(displaysCode ? .monospaced : .default)
        }
        .backgroundStyle(color)
    }
}
