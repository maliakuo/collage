//
//  PageGallery.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

import SwiftUI
import Foundation

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
                
                PageGalleryItem(backgroundStyle: Color.pink) {
                } label: {
                    Text("Today's date is     " + dateConverter(date: Date()))
                        .bold()
                        .italic()
                        .font(.system(size: 36, design: .monospaced))
                }
            }
            
        
            
            LazyVGrid(
                columns: [GridItem(Design.galleryGridSize)],
                spacing: 20
            ) {
                ForEach(pages.reversed()) { page in
                    PageGalleryItem(backgroundStyle: Color.cardFront) {
                        selectPage(page)
                    } label: {
                        Text(dateConverter(date: page.creationDate))
                            .font(.system(size: 24, design: .monospaced))
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
    
    func dateConverter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM y"
        return dateFormatter.string(from: date)
    }
}
