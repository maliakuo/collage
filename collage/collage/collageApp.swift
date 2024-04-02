//
//  collageApp.swift
//  collage
//
//  Created by Malia Kuo on 3/20/24.
//

import SwiftUI
import SwiftData

@main
struct collageApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Page.self, Element.self])
    }
}

//@main
//struct collageApp: App {
//    var container: ModelContainer
//
//    init() {
//        do {
//            let config1 = ModelConfiguration(for: Page.self)
//            let config2 = ModelConfiguration(for: Element.self)
//
//            container = try ModelContainer(for: Page.self, Element.self, configurations: config1, config2)
//        } catch {
//            fatalError("Failed to configure SwiftData container.")
//        }
//    }
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .modelContainer(for: [Page.self, Element.self])
//    }
//}
