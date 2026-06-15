//
//  MellowApp.swift
//  Mellow
//
//  Created by Julien Fernandes on 09/06/2026.
//

import SwiftUI

@main
struct MellowApp: App {
    var body: some Scene {
        Window("Mellow", id: "MellowApp") {
            MainView()
                .windowDismissBehavior(.disabled)
                .windowFullScreenBehavior(.disabled)
                .windowMinimizeBehavior(.disabled)
        }
        .windowResizability(.contentSize)
        .windowStyle(.hiddenTitleBar)
        .windowLevel(WindowLevel.floating)
    }
}
