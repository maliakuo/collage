//
//  ContentView.swift
//  collage
//
//  Created by Malia Kuo on 3/20/24.
//

import SwiftUI
import SwiftData

//struct ContentView: View {
//    @Query private var pages: [Page]
//    @State private var editing = false
//    @State private var navigationPath: [Page] = []
//    @Environment(\.modelContext) private var modelContext
//
//    var body: some View {
//        NavigationStack(path: $navigationPath) {
//            PageGallery(pages: pages, editing: $editing) { page in
//                withAnimation { navigationPath.append(page) }
//            } addPage: {
//                let newPage = Page(front: "Sample Front", back: "Sample Back")
//                modelContext.insert(newPage)
//                withAnimation {
//                    navigationPath.append(newPage)
//                    editing = true
//                }
//            }
//            .padding()
//            .toolbar { EditorToolbar(isEnabled: false, editing: $editing) }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//        .frame(minWidth: 500, minHeight: 500)
//        .modelContainer(previewContainer)
//}

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
                let newElement = Element(name: "String", isActive: true)
                elementArray.append(newElement)
                let newPage = Page(elements: elementArray)
//                let newPage = Page(elements: newElement])
                
                modelContext.insert(newPage)
                
//                do {
//                    try modelContext.delete(model: Page.self)
//                } catch {
//                    print("Failed to clear all Page data.")
//                }

                
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
        .modelContainer(previewContainer)
}