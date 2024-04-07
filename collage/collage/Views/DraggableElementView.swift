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
//    @State private var isDragging: Bool = false
//
//    private var element: Element
//    private var x: CGFloat
//    private var y: CGFloat
//
//    init(page: Page, idx: Int, isDragging: Bool, element: Element, x: CGFloat, y: CGFloat) {
//        self.page = page
//        self.idx = idx
//        self.isDragging = isDragging
//        self.element = element
//        self.x = x
//        self.y = y
//    }
//
//    var dragGesture: some Gesture{
//        DragGesture()
//            .onChanged { value in
//                self.x = value.x
//                self.y = value.y
//                self.isDragging = true
//            }
//
//            .onEnded { _ in
//                self.isDragging = false
//            }
//    }
//
//    var body: some View{
//        TextField("Field \(idx)", text: $page.elements[idx].name)
//            .position(CGPoint(x: $page.elements[idx].x, y: $page.elements[idx].y))
//            .gesture(dragGesture)
//    }
//}
//    var body: some View {
//        TextField("Field \(idx)", text: $page.elements[idx].name)
//    }
//    
//    @State private var isDragging:Bool = false
//    @State private var location:CGPoint
//        
//
//    init(page: Page, idx: Int, isDragging: Bool, location: CGPoint) {
//        self.page = page
//        self.idx = idx
//        self.isDragging = isDragging
//        self.location = location
//    }
    
//    var dragGesture: some Gesture{
//        DragGesture()
//            .onChanged { value in
//                self.location = value.location
//                self.isDragging = true
//            }
//        
//            .onEnded { _ in
//                self.isDragging = false
//            }
//    }
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
                print(self.location.x)
                print(self.location.y)
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

