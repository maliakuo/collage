
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
            ZStack {
                ForEach(page.elements) { element in
                    ZStack {
                        Rectangle()
                            .fill(.clear)
                        Text(element.name)
                            .bold(element.bold)
                            .italic(element.italic)
                            .font(.system(size: 18, design: .monospaced))
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.33)
                            .padding()
                        
                    }
                    .position(CGPoint(x: element.x, y: element.y))
                    .frame(width: element.fx, height: element.fy)
                }
            }
            .frame(width: 600)
        }
        .backgroundStyle(Color.cardFront)
    }
}

