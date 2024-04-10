//
//  ContentView.swift
//  collage
//
//  Created by Malia Kuo on 3/20/24.
//

import SwiftUI
import SwiftData
import CoreGraphics

struct ContentView: View {
    @Query private var pages: [Page]
    @State private var editing = false
    @State private var navigationPath: [Page] = []
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack(path: $navigationPath) {
            PageGallery(pages: pages, editing: $editing) { page in
                withAnimation { navigationPath.append(page) }
            } addPage: {
//                let newPage = Page(elements: [Element(name: "String", position: CGPoint(x:120, y:200), isActive: true)])
                var elementArray: [Element] = []
                let newElement = Element(name: "here", x: 120, y: 120, isActive: true, bold: false, italic: false)
//                let newElement2 = Element(name: "second", x: 200, y: 300, isActive: false)
                elementArray.append(newElement)
//                elementArray.append(newElement2)
                let newPage = Page(elements: elementArray)
//                let newPage = Page(elements: newElement])
                
                modelContext.insert(newPage)
//                
//                do {
//                    try modelContext.delete(model: Page.self)
//                } catch {
//                    print("Failed to clear all Page data.")
//                }

//                
                withAnimation {
                    navigationPath.append(newPage)
                    editing = true
                    
                }
            }
            .padding()
            .toolbar { EditorToolbar(isEnabled: false, editing: $editing) }
        }
    }
}

#Preview {
    ContentView()
        .frame(minWidth: 500, minHeight: 500)
        .modelContainer(for: [Page.self, Element.self])
}
