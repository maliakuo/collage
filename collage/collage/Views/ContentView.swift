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
                var elementArray: [Element] = []
                let newElement = Element(name: dateConverter(date: Date()), x: 120, y: 120, isActive: true, bold: false, italic: false, fx: 120, fy: 120)
                elementArray.append(newElement)
                let newPage = Page(elements: elementArray)
                
                modelContext.insert(newPage)

                withAnimation {
                    navigationPath.append(newPage)
                    editing = true
                    
                }
            }
            .padding()
            .toolbar { EditorToolbar(isEnabled: false, editing: $editing) }
        }
    }
    
    
    func dateConverter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM y"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    ContentView()
        .frame(minWidth: 500, minHeight: 500)
        .modelContainer(for: [Page.self, Element.self])
}
