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
    @Environment(\.modelContext) private var modelContext
    @Bindable var page: Page
    @FocusState private var focusedField: FocusedField?
    @State private var bold = false
    @State private var italic = false
    
    var body: some View {
        PageContainerView {
            ZStack {
                    ForEach(page.elements.indices, id: \.self) { idx in
                        DraggableElementView(page: page, idx: idx, location:CGPoint(x:page.elements[idx].x, y:page.elements[idx].y))
                    }
            }
            .background(Color.cardFront, in: .rect(
                bottomLeadingRadius: Design.cardCornerRadius,
                bottomTrailingRadius: Design.cardCornerRadius))
            .frame(width: 600)
            .textFieldStyle(.squareBorder)
        }
        .backgroundStyle(Color.cardFront)
        .defaultFocus($focusedField, .front)
        .padding(.horizontal, Design.carouselCardHorizontalPadding)
        .toolbar {
            ToolbarItemGroup {
                Button("Text") {
                    print("pressed")
//                    var currentElementArray = page.elements
//                    var newElement = Element(name: "new text", x: 200, y: 200, isActive: false)
//                    currentElementArray.append(newElement)
////                    page.elements.removeAll()
//                    
//                    page.elements = currentElementArray
                    page.elements.append(Element(name: "new text", x: 200, y: 200, isActive: false))
                    do {
                        try modelContext.save()
                        print("saved it")
                    } catch {
                        print("Failed to save Page.")
                    }
                }
                Toggle(isOn: $bold) {
                    Image(systemName: "bold")
                }
                Toggle(isOn: $italic) {
                    Image(systemName: "italic")
                }
            }
        }
    }
}

///// An enum describing the fields that can be focused in the editor view
private enum FocusedField {
    case front
}
//
///// The standard layout for the fields in the editor view.
//private struct PageFieldLabeledContentStyle: LabeledContentStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        VStack(alignment: .leading) {
//            configuration.label
//                .textCase(.uppercase)
//                .font(.subheadline.bold())
//                .foregroundStyle(.secondary)
//            Spacer()
//            configuration.content
//                .font(Design.cardViewingFont)
//                .multilineTextAlignment(.center)
//                .padding(2)
//                .background(.fill.quaternary, in: .rect(cornerRadius: 4))
//            Spacer()
//        }
//        .frame(width: 600)
//    }
//}





////
////  PageEditorView.swift
////  collage
////
////  Created by Malia Kuo on 3/21/24.
////
//
////import SwiftUI
////
//
//
//import SwiftUI
//
//struct PageEditorView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Bindable var page: Page
//    @FocusState private var focusedField: FocusedField?
//    @State private var bold = false
//    @State private var italic = false
//    
//    var body: some View {
//        PageContainerView {
//            ZStack {
//                LabeledContent("Front") {
//                    ForEach(page.elements.indices, id: \.self) { idx in
//                        DraggableElementView(page: page, idx: idx, location:CGPoint(x:page.elements[idx].x, y:page.elements[idx].y))
//                    }
//                }
////                .frame(width: 600, height: 400)
//                .padding()
//                .background(Color.cardFront, in: .rect(
//                    bottomLeadingRadius: Design.cardCornerRadius,
//                    bottomTrailingRadius: Design.cardCornerRadius))
//            }
//            .frame(width: 600)
//            .labeledContentStyle(PageFieldLabeledContentStyle())
//            .textFieldStyle(.squareBorder)
//            .overlay(alignment: .topTrailing) {
//                Text("Created at \(page.creationDate, format: .dateTime)")
//                    .foregroundStyle(.secondary)
//                    .font(.footnote)
//                    .padding()
//            }
//        }
////        .backgroundStyle(Color.cardFront)
//        .defaultFocus($focusedField, .front)
//        .padding(.horizontal, Design.carouselCardHorizontalPadding)
//        .toolbar {
//            ToolbarItemGroup {
//                Button("Text") {
//                    print("pressed")
//                    let newElement = Element(name: "new text", x: 200, y: 200, isActive: false)
//                    page.elements.append(newElement)
//                    do {
//                        try modelContext.save()
//                        print("saved it")
//                    } catch {
//                        print("Failed to save Page.")
//                    }
//                }
//                Toggle(isOn: $bold) {
//                    Image(systemName: "bold")
//                }
//                Toggle(isOn: $italic) {
//                    Image(systemName: "italic")
//                }
//            }
//        }
//    }
//}
//
///// An enum describing the fields that can be focused in the editor view
//private enum FocusedField {
//    case front
//}
//
///// The standard layout for the fields in the editor view.
//private struct PageFieldLabeledContentStyle: LabeledContentStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        VStack(alignment: .leading) {
//            configuration.label
//                .textCase(.uppercase)
//                .font(.subheadline.bold())
//                .foregroundStyle(.secondary)
//            Spacer()
//            configuration.content
//                .font(Design.cardViewingFont)
//                .multilineTextAlignment(.center)
//                .padding(2)
//                .background(.fill.quaternary, in: .rect(cornerRadius: 4))
//            Spacer()
//        }
//        .frame(width: 600)
//    }
//}
