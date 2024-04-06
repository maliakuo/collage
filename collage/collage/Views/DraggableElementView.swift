//
//  DraggableView.swift
//  SwiftDataFlashCardSample
//
//  Created by Malia Kuo on 3/5/24.
//  Copyright © 2024 Apple. All rights reserved.
//


import SwiftUI

struct DraggableElementView:View{
    @Bindable var page: Page
    var idx: Int
    
    var body: some View {
        TextField("Field \(idx)", text: $page.elements[idx].name)
    }
    
//    @State private var isDragging:Bool = false
//    @State private var location:CGPoint
//    
//    private let imageName:String
//    
//    init(location:CGPoint,imageName:String){
//        self.location = location
//        self.imageName = imageName
//    }
//    
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
//    
//    var body: some View{
//        Image(imageName)
//            .resizable()
//            .scaledToFit()
//            .frame(height: 100)
//            .foregroundColor(isDragging ? .blue : .black)
//            .position(location)
//            .gesture(dragGesture)
//    }
}

