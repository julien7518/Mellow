//
//  MainView.swift
//  Mellow
//
//  Created by Julien Fernandes on 09/06/2026.
//

import SwiftUI

struct MainView: View {
    @State private var currentTime: Double = 50.0
    @State private var isEditingSlider: Bool = false
    
    struct BounceButton: View {
        let systemName: String
        @State private var bounceID = UUID()
        var body: some View {
            Button(action: {
                bounceID = UUID()
            }) {
                Image(systemName: systemName)
                    .symbolEffect(.bounce, value: bounceID)
                    .opacity(0.5)
            }
            .buttonStyle(.plain)
        }
    }
    
    var body: some View {
        GlassEffectContainer {
            HStack(alignment: .center) {
                Image("Album poster")
                    .frame(width: 100, height: 100, alignment: .leading)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(.gray.opacity(0.1), lineWidth: 1)
                    )
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Song name")
                            .font(.headline)
                        Text("Album name")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                        Text("Artist name")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    HStack(spacing: 26) {
                        BounceButton(systemName: "backward.fill")
                        BounceButton(systemName: "play.fill")
                        BounceButton(systemName: "forward.fill")
                        BounceButton(systemName: "heart")
                    }
                    .font(.title2)
                    Slider(
                        value: $currentTime,
                        in: 0...100,
                        onEditingChanged: { editing in
                            isEditingSlider = editing
                        }
                    )
                    .sliderThumbVisibility(.hidden)
                }
                .padding(10)
            }
            .padding(10)
            .frame(width: 310, height: 115)
            .glassEffect(in: .rect(cornerRadius: 10))
        }
    }
}

#Preview {
    MainView()
}
