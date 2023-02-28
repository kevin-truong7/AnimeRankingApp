//
//  DetailView.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-02-26.
//

// View is used to display more info on the anime when clicked

import Foundation
import SwiftUI

struct DetailView: View {
    
    @Binding var anime: AnimeLibrary
    
    var body: some View {
        List {
            Section(header: Text("Characters")) {
                ForEach(anime.characters) {
                    character in
                    Label(character.name, systemImage: "person")
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(anime: .constant(AnimeLibrary.sampleData[0]))
        }
    }
}
