//
//  ContentView.swift
//  Mellow
//
//  Created by Julien Fernandes on 09/06/2026.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        HStack{
            Image("mellow")
                .frame(width: 100, height: 100, alignment: Alignment.leading)
                .background(Color.blue)
            VStack{
                VStack{
                    Text("Song name")
                    Text("Artist name")
                    Text("Album name")
                }
                HStack{
                    Image("play")
                    Image("next")
                    Image("previous")
                }
                Rectangle()
            }
            .padding(5)
            .background(Color.green)
        }
        .frame(maxWidth: 330, maxHeight: 160)
        .background(Color.red)
    }
}

#Preview {
    MainView()
}
