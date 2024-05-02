//
//  DraggableView.swift
//  SwiftDataFlashCardSample
//
//  Created by Malia Kuo on 3/5/24.
//  Copyright © 2024 Apple. All rights reserved.
//


import SwiftUI
import CoreGraphics

struct DraggableElementView:View{
    @Environment(\.modelContext) private var modelContext
    @Bindable var page: Page
    var idx: Int

    @State private var isDragging:Bool = false
    @State private var location:CGPoint
        
    init(page: Page, idx: Int, location: CGPoint) {
        self.page = page
        self.idx = idx
        self.location = location
    }
    
    var dragGesture: some Gesture{
        DragGesture()
            .onChanged { value in
                self.location = value.location
                self.isDragging = true
            }
        
            .onEnded { _ in
                self.isDragging = false
                
                if (self.location.x <= -183) {
                    let diff = -self.location.x - 183
                    self.location.x = self.location.x + diff
                } else if (self.location.x >= 304) {
                    let diff = self.location.x - 304
                    self.location.x = self.location.x - diff
                } else if (self.location.y <= -286) {
                    let diff = -self.location.y - 286
                    self.location.y = self.location.y + diff
                } else if (self.location.y >= 410) {
                    let diff = self.location.y - 410
                    self.location.y = self.location.y - diff
                }
                
                
                page.elements[idx].x = self.location.x
                page.elements[idx].y = self.location.y
                do {
                    try modelContext.save()
                } catch {
                    print("Failed to save Page.")
                }
            }
    }
    
    var body: some View{
        ZStack {
            Rectangle()
                .fill(Color.cardFront)
                .border(.blue)
            TextField("Field \(idx)", text: $page.elements[idx].name)
                .padding(.horizontal)
                .bold(page.elements[idx].bold)
                .italic(page.elements[idx].italic)
                .font(.system(size: 18, design: .monospaced))
                .multilineTextAlignment(.center)
                .padding(2)
                .background(.fill.quaternary, in: .rect(cornerRadius: 4))
        }
        .contextMenu {
            Button(action: {
                page.elements[idx].bold = !page.elements[idx].bold
            }){
                Text("Bold")
            }
            
            Button(action: {
                page.elements[idx].italic = !page.elements[idx].italic
            }){
            Text("Italics")
            }
            
            Button(action: {
                page.elements[idx].fx = page.elements[idx].fx * 2
                page.elements[idx].fy = page.elements[idx].fy * 2
            }){
            Text("2x")
            }
            
            Button(action: {
                page.elements[idx].fx = page.elements[idx].fx / 2
                page.elements[idx].fy = page.elements[idx].fy / 2
            }){
            Text("0.5x")
            }
       }
        .animation(.easeInOut)
        .position(location)
        .gesture(dragGesture)
        .frame(width: page.elements[idx].fx, height: page.elements[idx].fy)
        
    }
}
