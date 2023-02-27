//
//  ContentView.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-02-26.
//

import SwiftUI

struct AnimeListView: View {
    
    @Binding var anime: [AnimeLibrary]
    
    var body: some View {
        List {
            ForEach($anime) { $anime in
                NavigationLink(destination: DetailView(anime: $anime)) {
                    
                }
            }
        }
    }
}

struct AnimeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimeListView(anime: .constant(AnimeLibrary.sampleData))
        }
    }
}
