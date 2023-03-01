//
//  AnimeRankingApp.swift
//  AnimeRanking
//
//  Created by Kevin Truong on 2023-02-26.
//

import SwiftUI

// This @main indicates the app's main point of entry during launch
@main
struct AnimeRankingApp: App {
    
    // This will need to be changed later to equal the data from API
    @State private var anime = AnimeLibrary.sampleData
    
    private var controller = HomePageViewController()
        
    var body: some Scene {
        WindowGroup {
            NavigationView {
                // the parameter anime in the AnimeListView initializer
                // is expecting a binding to an array of "Anime" objects,
                // which is represented by the $anime syntax.
                // A binding is a two-way connection between a view and
                // a source of truth, such as a property or a state variable.
                AnimeListView(anime: $anime)
            }
        }
    }
}
