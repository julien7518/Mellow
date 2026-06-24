//
//  Utils.swift
//  Mellow
//
//  Created by Julien Fernandes on 24/06/2026.
//

import Foundation

extension Double {
    func toMMSS() -> String {
        let totalSeconds = Int(self.rounded())
        let minutes = totalSeconds / 60
        let remainingSeconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}
