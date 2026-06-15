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

    init(songName: String? = nil, artistName: String? = nil, albumName: String? = nil, albumPoster: ImageResource? = nil) {
        self.songName = songName
        self.artistName = artistName
        self.albumName = albumName
        self.albumPoster = albumPoster
    }
    
    struct BounceButton: View {
        let systemName: String
        @State private var bounceID = UUID()
        var body: some View {
            Button(action: {
                bounceID = UUID()
            }) {
                Image(systemName: systemName)
                    .symbolEffect(.bounce, value: bounceID)
            }
            .buttonStyle(.plain)
        }
    }

    var body: some View {
        GlassEffectContainer {
            HStack(alignment: .top) {
                Group {
                    if let albumPoster {
                        Image(albumPoster)
                    } else {
                        Image(systemName: "music.note")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.tertiary)
                    }
                }
                .frame(width: 110, height: 110, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.gray.opacity(0.1), lineWidth: 1))
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    HStack{
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
                    }
                    HStack(spacing: 26) {
                        BounceButton(systemName: "backward.fill")
                        BounceButton(systemName: "play.fill")
                        BounceButton(systemName: "forward.fill")
                        BounceButton(systemName: "heart")
                    }
                    .font(.title2)
                    Slider(value: .constant(0.5), in: 0...1)
                }
                .padding(8)
            }
            .padding(10)
            .frame(width: 330, height: 130)
        }
    }
}

#Preview {
    MainView(songName: "Hinata", artistName: "TIF", albumName: "1.6")
}
