//
//  Page.swift
//  collage
//
//  Created by Malia Kuo on 3/21/24.
//

import Foundation
import CoreGraphics
import SwiftData
import SwiftUI

@Model
final class Element {
    let id = UUID()
    var name: String = ""
    var x: CGFloat = 120
    var y: CGFloat = 120
//    var position: CGPoint
    var isActive: Bool = false
    
    var bold: Bool = false
    var italic: Bool = false
    
    var fx: CGFloat = 120
    var fy: CGFloat = 120
    
    init(name: String, x: CGFloat, y: CGFloat, isActive: Bool, bold: Bool, italic: Bool, fx: CGFloat, fy: CGFloat) {
        self.name = name
        self.x = x
        self.y = y
        self.isActive = isActive
        self.bold = bold
        self.italic = italic
        self.fx = fx
        self.fy = fy
    }
}

extension Element: Identifiable { }

extension Element: Hashable {
    static func == (lhs: Element, rhs: Element) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.x == rhs.x &&
        lhs.y == rhs.y &&
        lhs.isActive == rhs.isActive
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(x)
        hasher.combine(y)
        hasher.combine(isActive)
    }
}

@Model
final class Page {
    let id = UUID()
    var creationDate: Date
    var elements: [Element]

    init(creationDate: Date = .now, elements: [Element]) {
        self.creationDate = creationDate
        self.elements = elements
    }
}

extension Page: Identifiable { }

extension Page: Hashable {
    static func == (lhs: Page, rhs: Page) -> Bool {
        lhs.id == rhs.id &&
        lhs.elements == rhs.elements &&
        lhs.creationDate == rhs.creationDate
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(elements)
        hasher.combine(creationDate)
    }
}
