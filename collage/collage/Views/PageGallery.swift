//
//  PageGallery.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

import SwiftUI

struct PageGallery: View {
    var pages: [Page]
    @Binding var editing: Bool
    let selectPage: (Page) -> Void
    let addPage: () -> Void
    

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(Design.galleryGridSize)],
                spacing: 20
            ) {
                if Design.editFeatureEnabled {
                    PageGalleryItem(backgroundStyle: .fill.tertiary, action: addPage) {
                        LabeledContent("Add Page") {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                        .labelsHidden()
                    }
                    .shadow(radius: 2)
                }

                ForEach(pages) { page in
                    PageGalleryItem(backgroundStyle: Color.cardFront) {
                        selectPage(page)
                    } label: {
                        Text("page.elements[0].name")
                    }
                }
            }
        }
        .scrollClipDisabled()
        .navigationDestination(for: Page.self) { [editing] selectedPage in
            PageCarousel(editing: editing, pages: pages, selectedPage: selectedPage)
                .toolbar { EditorToolbar(isEnabled: true, editing: $editing) }
                .onDisappear { $editing.wrappedValue = false }
        }
    }
}


//struct PageGallery: View {
//    var pages: [Page]
//    @Binding var editing: Bool
//    let selectPage: (Page) -> Void
//    let addPage: () -> Void
//
//    var body: some View {
//        ScrollView {
//            LazyVGrid(
//                columns: [GridItem(Design.galleryGridSize)],
//                spacing: 20
//            ) {
//                if Design.editFeatureEnabled {
//                    PageGalleryItem(backgroundStyle: .fill.tertiary, action: addPage) {
//                        LabeledContent("Add Page") {
//                            Image(systemName: "plus")
//                                .imageScale(.large)
//                        }
//                        .labelsHidden()
//                    }
//                    .shadow(radius: 2)
//                }
//
//                ForEach(pages) { page in
//                    PageGalleryItem(backgroundStyle: Color.cardFront) {
//                        selectPage(page)
//                    } label: {
//                        Text(page.front)
//                    }
//                }
//            }
//        }
//        .scrollClipDisabled()
//        .navigationDestination(for: Page.self) { [editing] selectedPage in
//            PageCarousel(editing: editing, pages: pages, selectedPage: selectedPage)
//                .toolbar { EditorToolbar(isEnabled: true, editing: $editing) }
//                .onDisappear { $editing.wrappedValue = false }
//        }
//    }
//}
