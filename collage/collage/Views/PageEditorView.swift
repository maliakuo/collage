//
//  PageEditorView.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

//import SwiftUI
//


import SwiftUI

struct PageEditorView: View {
    @Bindable var page: Page
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        PageContainerView {
            VStack(spacing: 0) {
                LabeledContent("Front") {

                    ForEach(page.elements.indices) { idx in
//                        DraggableElementView(page: page, idx: idx, isDragging: false, location: CGPoint(x: page.elements[idx].x, y: page.elements[idx].y))
                        DraggableElementView(page: page, idx: idx, location:CGPoint(x:page.elements[idx].x, y:page.elements[idx].y))
//                        TextField("Field \(idx)", text: $page.elements[idx].name)
//                            .frame(width: 120, height: 120)
                        }
                    
                }
                .frame(width: 600, height: 750)
                .padding()
                .background(Color.cardFront, in: .rect(
                    bottomLeadingRadius: Design.cardCornerRadius,
                    bottomTrailingRadius: Design.cardCornerRadius))

            }
            .labeledContentStyle(PageFieldLabeledContentStyle())
            .textFieldStyle(.squareBorder)
            .overlay(alignment: .topTrailing) {
                Text("Created at \(page.creationDate, format: .dateTime)")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding()
            }
        }
//        .backgroundStyle(Color.cardFront)
        .defaultFocus($focusedField, .front)
        .padding(.horizontal, Design.carouselCardHorizontalPadding)
    }
}

/// An enum describing the fields that can be focused in the editor view
private enum FocusedField {
    case front
}

/// The standard layout for the fields in the editor view.
private struct PageFieldLabeledContentStyle: LabeledContentStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .textCase(.uppercase)
                .font(.subheadline.bold())
                .foregroundStyle(.secondary)
            Spacer()
            configuration.content
                .font(Design.cardViewingFont)
                .multilineTextAlignment(.center)
                .padding(2)
                .background(.fill.quaternary, in: .rect(cornerRadius: 4))
            Spacer()
        }
    }
}
