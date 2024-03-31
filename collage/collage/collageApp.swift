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
        .modelContainer(for: Page.self)
    }
}
