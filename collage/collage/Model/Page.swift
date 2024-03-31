//
//  Page.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

import Foundation
import SwiftData
import SwiftUI

//@Model
//final class Page {
//    var front: String
//    var back: String
//    var creationDate: Date
//
//    init(front: String, back: String, creationDate: Date = .now) {
//        self.front = front
//        self.back = back
//        self.creationDate = creationDate
//    }
//}
//
//extension Page: Identifiable { }
//
//extension Page: Hashable {
//    static func == (lhs: Page, rhs: Page) -> Bool {
//        lhs.front == rhs.front &&
//        lhs.back == rhs.back &&
//        lhs.creationDate == rhs.creationDate
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(front)
//        hasher.combine(back)
//        hasher.combine(creationDate)
//    }
//}

//extension CGPoint : Hashable {
//  public func hash(into hasher: inout Hasher) {
//    hasher.combine(x)
//    hasher.combine(y)
//  }
//}
//
// creating a new class of elements
@Model
final class Element {
    var name: String
//    var position: CGPoint
    var isActive: Bool
    
    // initializing the location of an element to always be this random set of coordinates
//    init(name: String, position: CGPoint, isActive: Bool) {
//        self.name = name
//        self.position = position
//        self.isActive = isActive
//    }
    init(name: String, isActive: Bool) {
        self.name = name
        self.isActive = isActive
    }
}

extension Element: Identifiable { }

//extension Element: Hashable {
//    static func == (lhs: Element, rhs: Element) -> Bool {
//        lhs.name == rhs.name &&
//        lhs.position == rhs.position &&
//        lhs.isActive == rhs.isActive
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        hasher.combine(position)
//        hasher.combine(isActive)
//    }
//}

extension Element: Hashable {
    static func == (lhs: Element, rhs: Element) -> Bool {
        lhs.name == rhs.name &&
        lhs.isActive == rhs.isActive
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(isActive)
    }
}

//struct Element: Identifiable {
//    var id = UUID()
//    var name: String
//    var isActive: Bool
//    
//    init(name: String, isActive: Bool) {
//        self.name = name
//        self.isActive = isActive
//    }
//}
//
//extension Element: Hashable {
//    static func == (lhs: Element, rhs: Element) -> Bool {
//        lhs.name == rhs.name &&
//        lhs.isActive == rhs.isActive
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        hasher.combine(isActive)
//    }
//}

@Model
final class Page {
    var creationDate: Date
    var elements: [Element] = []

    init(creationDate: Date = .now, elements: [Element]) {
        self.creationDate = creationDate
        self.elements = elements
    }
}

extension Page: Identifiable { }

extension Page: Hashable {
    static func == (lhs: Page, rhs: Page) -> Bool {
        lhs.elements == rhs.elements &&
        lhs.creationDate == rhs.creationDate
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(elements)
        hasher.combine(creationDate)
    }
}