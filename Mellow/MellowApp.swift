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
        WindowGroup {
            MainView()
        }
        .windowResizability(.contentSize)
        .windowStyle(.hiddenTitleBar)
        .windowLevel(WindowLevel.floating)
        .defaultSize(width: 330, height: 160)
    }
}
