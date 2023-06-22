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
    
    @StateObject private var viewModel = HomeViewModel()
        
    var body: some Scene {
        WindowGroup {
           MainPageView()
        }
    }
}

