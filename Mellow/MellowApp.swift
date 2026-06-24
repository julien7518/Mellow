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
<<<<<<< HEAD
        Window("Mellow", id: "MellowApp") {
            AppView()
                .windowDismissBehavior(.disabled)
                .windowFullScreenBehavior(.disabled)
                .windowMinimizeBehavior(.disabled)
=======
        Window("Main window", id: "main-window") {
            MainView()
>>>>>>> main
        }
        .windowResizability(.contentSize)
        .windowLevel(WindowLevel.floating)
<<<<<<< HEAD
=======
        .defaultSize(width: 330, height: 160)
        .windowStyle(.plain)
        .windowBackgroundDragBehavior(WindowInteractionBehavior.enabled)
        
        Settings {
            SettingsView()
        }
>>>>>>> main
    }
}
