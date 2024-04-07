
//
//  PageEditorView.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

//import SwiftUI
//
//
//  CardReaderView.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

import SwiftUI

struct PageReadingView: View {
    var page: Page
    var displaysCode: Bool = false

    var body: some View {
        PageContainerView {
            VStack {
                ForEach(page.elements) { element in
                    Text(element.name)
                        .font(Design.cardViewingFont)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.33)
                        .padding()
                    }
            }
            .frame(width: 600, height: 750)
        }
        .backgroundStyle(Color.cardFront)
    }
}

