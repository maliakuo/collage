//
//  PageCarousel.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

import SwiftUI

struct PageCarousel: View {
    @State private var selectedPageID: Page.ID?
    @FocusState private var focusPageID: Page.ID?
    private let initialPageID: Page.ID

    let editing: Bool
    var pages: [Page]

    init(editing: Bool, pages: [Page], selectedPage: Page) {
        self.editing = editing
        self.pages = pages
        initialPageID = selectedPage.id
    }

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(pages) { page in
                        Group {
                            if editing {
                                PageEditorView(page: page)
                            } else {
//                                PageReaderView(color: .cardFront, text: page.elements[0].name)
                                PageReadingView(page: page)
                            }
                        }
                        .containerRelativeFrame(.horizontal) { width, _ in
                            min(width, Design.carouselCardMaxWidth)
                        }
                        .containerRelativeFrame(.horizontal)
                        .focused($focusPageID, equals: page.id)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $selectedPageID)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            Text("Swipe left/right to review other pages")
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .font(.footnote)
        }
        .background()
        .onAppear { selectedPageID = initialPageID }
        .onChange(of: selectedPageID) { focusPageID = $1 }
    }
}

