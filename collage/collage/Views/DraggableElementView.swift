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
                page.elements[idx].x = self.location.x
                page.elements[idx].y = self.location.y
            }
    }
    
    var body: some View{
        ZStack {
            Rectangle()
                .fill(.orange)
            TextField("Field \(idx)", text: $page.elements[idx].name)
                
        }
        .position(location)
        .gesture(dragGesture)
        .frame(width: 120, height: 120)
    }
}

