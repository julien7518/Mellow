//
//  MainView.swift
//  Mellow
//
//  Created by Julien Fernandes on 09/06/2026.
//

import SwiftUI

struct MainView: View {
    let songName: String?
    let artistName: String?
    let albumName: String?
    let albumPoster: ImageResource?
    let totalTime: Double?

    init(
        songName: String? = nil, artistName: String? = nil, albumName: String? = nil,
        albumPoster: ImageResource? = nil, totalTime: Double? = nil
    ) {
        self.songName = songName
        self.artistName = artistName
        self.albumName = albumName
        self.albumPoster = albumPoster
        self.totalTime = totalTime
    }

    @State private var currentTime: Double = 0.0
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
                Group {
                    if let albumPoster {
                        Image(albumPoster)
                    } else {
                        Image(systemName: "music.note")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.tertiary)
                            .controlSize(.extraLarge)
                    }
                }
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(.gray.opacity(0.1), lineWidth: 1)
                )
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(songName ?? "Song name")
                            .font(.headline)
                        Text(albumName ?? "Album name")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                        Text(artistName ?? "Artist name")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    HStack() {
                        BounceButton(systemName: "backward.fill")
                        Spacer()
                        BounceButton(systemName: "play.fill")
                        Spacer()
                        BounceButton(systemName: "forward.fill")
                        Spacer()
                        BounceButton(systemName: "heart")
                    }
                    .font(.title2)
                    Spacer()
                    Slider(
                        value: $currentTime,
                        in: 0...(totalTime ?? 0.0),
                    ) {
                    } minimumValueLabel: {
                        Text(currentTime.toMMSS())
                    } maximumValueLabel: {
                        Text((totalTime ?? 0.0).toMMSS())
                    } onEditingChanged: {
                        editing in
                        isEditingSlider =
                            editing
                    }
                    .sliderThumbVisibility(.hidden)

                }
                .padding(4)
            }
            .padding(8)
            .frame(width: 310, height: 115)
            .glassEffect(.regular, in: .rect(cornerRadius: 10))
        }
    }
}

#Preview {
    MainView(songName: "HINATA", artistName: "TIF", albumName: "1.6", totalTime: 175)
}
